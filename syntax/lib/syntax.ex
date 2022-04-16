defmodule Syntax do
  # area = pi * radio ** 2
  # :lexer.string('area = pi * radio ** 2')
  # Syntax.format(elem(:lexer.string('area = pi * radio ** 2'),1))
  # tokens = [{:identifier, 'area'}, {:operator, '='}, {:identifier, 'pi'}, {:operator, '*'}, {:identifier, 'radio'}, {:operator, '**'}, {:int, '2'}]
  # Syntax.format(elem(:lexer.string('  '),1))
  def read(file) do
    File.read!(file)
    |> String.to_charlist()
    |> syntax()
  end

  def syntax(text) do

    htmlStr = format(elem(:lexer.string(text),1))
    File.write("htmlFile.txt", htmlStr) #Ponemos el resultado en un archivo
  end

  def format(tokens) do
    Enum.map(tokens, fn {token, tchars} ->
      tchars = List.to_string(tchars)
      tchars = HtmlEntities.encode(tchars)

      case token do
        :space -> "<span class='space'>#{tchars}</span>"
        :newline -> "<span class='newline'><br></span>"
        :identifier -> "<span class='identifier'>#{tchars}</span>"
        :data_type -> "<span class='data-type'>#{tchars}</span>"
        :data -> "<span class='data'>#{tchars}</span>"
        :assign -> "<span class='assign'>#{tchars}</span>"
        :operator -> "<span class='operator'>#{tchars}</span>"
        :relation -> "<span class='relation'>#{tchars}</span>"
        :logical -> "<span class='logical'>#{tchars}</span>"
        :keyword -> "<span class='keyword'>#{tchars}</span>"
        :int -> "<span class='int'>#{tchars}</span>"
        :string -> "<span class='string'>#{tchars}</span>"
        :include -> "<span class='include'>#{tchars}</span>"
        :header -> "<span class='header'>#{tchars}</span>"
        :data_type -> "<span class='data-type'>#{tchars}</span>"
        _ -> "<span>#{tchars}</span>"
      end
    end)
    |> Enum.join()


  end

  # def write(tokens) do
  #   htmlStr = format((tokens))
  #   File.write("htmlFile.txt", htmlStr)
  # end

end
