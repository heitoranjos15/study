defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.at(0)
  end

  def initial(name) do
    name
    |> String.upcase()
    |> first_letter
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first, second] = String.split(full_name)
    "#{initial(first)} #{initial(second)}"
  end

  def pair(full_name1, full_name2) do
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *
    i1 = initials(full_name1)
    i2 = initials(full_name2)

    heart =
      "     ******       ******\n   **      **   **      **\n **         ** **         **\n**            *            **\n**                         **\n**     A. B.  +  C. D.     **\n **                       **\n   **                   **\n     **               **\n       **           **\n         **       **\n           **   **\n             ***\n              *\n"

    heart
    |> String.replace("A. B.", i1)
    |> String.replace("C. D.", i2)
  end
end
