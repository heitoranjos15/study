defmodule NameBadge do
  @separator " - "
  def print(id, name, department) do
    id_str = if id, do: "[#{id}]"

    department_str = if department, do: String.upcase(department), else: "OWNER"

    [id_str, name, department_str]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(@separator)
  end
end
