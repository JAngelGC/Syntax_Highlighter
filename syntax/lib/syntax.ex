defmodule Syntax do
  def format(tokens) do
    Enum.map(tokens, fn {token, tchars} ->
      tchars = List.to_string(tchars)
      tchars = HtmlEntities.encode(tchars)

      case token do
        :identifier -> "<span class=\"identifier\">#{tchars}</span>"
        :data_type -> "<span class=\"identifier\">#{tchars}</span>"
        :data -> "<span class=\"identifier\">#{tchars}</span>"
        :assign -> "<span class=\"identifier\">#{tchars}</span>"
        :operator -> "<span class=\"identifier\">#{tchars}</span>"
        :relation -> "<span class=\"identifier\">#{tchars}</span>"
        :logical -> "<span class=\"identifier\">#{tchars}</span>"
        _ -> "<span>#{tchars}</span>"
      end
    end)
  end
end
