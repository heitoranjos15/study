import * as E from "fp-ts/Either";
import { pipe } from "fp-ts/lib/function";
import { database } from '../database';
import { Character, characterCodec, FilterCharacter } from './types/character';

type GetCharacter = (filterBy: FilterCharacter) => E.Either<string, Character[]>;
type CreateCharacter = (payload: Character) => E.Either<string, Character>;

const filterCharacter = (filterBy: FilterCharacter) => (database: unknown): E.Either<string, Character[]> => {
  if (Array.isArray(database)) {
    const right = E.right(database.filter((data) => data[filterBy.filterBy] === filterBy.value));
    return right;
  }
  return E.left('Invalid database');

}

const validateCharacter = (payload: Character): E.Either<string, Character> => {
  if (characterCodec.decode(payload)) {
    return E.right(payload);
  }
  return E.left('invalid character');
}

export const getCharacter: GetCharacter = (filterBy: FilterCharacter) => {
  return pipe(
    database(),
    filterCharacter(filterBy)
  );
}


export const createCharacter: CreateCharacter = (payload: Character) => {
  return pipe(
    payload,
    validateCharacter
  )
}


