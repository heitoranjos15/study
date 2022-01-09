import * as t from 'io-ts';
import { withMessage } from 'io-ts-types';

const infoCharacterCodec = t.type({
  sex: t.string,
  birthday: t.string,
  weight: t.number,
  heigth: t.number,
  bloodType: t.string,
  occupation: t.string,
  partner: t.string,
  ninjaPatent: t.string,
  ninjaId: t.string,
});

export const characterCodec = t.type({
  id: t.number,
  name: t.string,
  images: t.array(t.string),
  about: t.array(t.string),
  page: t.string,
  info: infoCharacterCodec,
});

export type Character = t.TypeOf<typeof characterCodec>;

type FilterBrand = {
  readonly Filter: unique symbol
}

export const filterCharactByCodec = withMessage(
  t.brand(
    t.string,
    (value): value is t.Branded<string, FilterBrand> => isValidFilter(value),
    'Filter',
  ),
  () => 'Filter are not valid',
);

function isValidFilter(value: string) {
  const validFilters = ['name', 'age']
  return !!validFilters.filter((filter) => filter === value).length
}

export const filterCharacterCodec = t.type({
  filterBy: filterCharactByCodec,
  value: t.string,
});

export type FilterCharacter = t.TypeOf<typeof filterCharacterCodec>;
