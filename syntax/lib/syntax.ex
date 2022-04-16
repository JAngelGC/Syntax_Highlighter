defmodule Syntax do

  # area = pi * radio ** 2
  # :lexer.string('area = pi * radio ** 2')
  # Syntax.format(elem(:lexer.string('area = pi * radio ** 2'),1))
  # tokens = [{:identifier, 'area'}, {:operator, '='}, {:identifier, 'pi'}, {:operator, '*'}, {:identifier, 'radio'}, {:operator, '**'}, {:int, '2'}]
  # Syntax.format(elem(:lexer.string('  '),1))

  def syntax(text) do
    Syntax.format(elem(:lexer.string(text),1))
  end

  def format(tokens) do
    Enum.map(tokens, fn {token, tchars} ->
      tchars = List.to_string(tchars)
      tchars = HtmlEntities.encode(tchars)

      case token do
        :space -> "<span class=\"space\">#{tchars}</span>"
        :newline -> "<span class=\"newline\"><br></span>"
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
    |> Enum.join()
  end
end
