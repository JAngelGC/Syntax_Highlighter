defmodule Syntax do
  # area = pi * radio ** 2
  # :lexer.string('area = pi * radio ** 2')
  # Syntax.format(elem(:lexer.string('area = pi * radio ** 2'),1))
  # tokens = [{:identifier, 'area'}, {:operator, '='}, {:identifier, 'pi'}, {:operator, '*'}, {:identifier, 'radio'}, {:operator, '**'}, {:int, '2'}]
#   Syntax.format(elem(:lexer.string('//Hola
#   // Your First C++ Program
# a = 1 + b;
#   '),1))

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
        :comment -> "<span class='comment'>#{tchars}</span>"
        :data_type -> "<span class='data-type'>#{tchars}</span>"
        :number -> "<span class='number'>#{tchars}</span>"
        :string -> "<span class='string'>#{tchars}</span>"
        :assign -> "<span class='assign'>#{tchars}</span>"
        :operator -> "<span class='operator'>#{tchars}</span>"
        :relation -> "<span class='relation'>#{tchars}</span>"
        :logical -> "<span class='logical'>#{tchars}</span>"
        :identifier -> "<span class='identifier'>#{tchars}</span>"
        _ -> "<span>#{tchars}</span>"
      end
    end)
    |> Enum.join()

    # File.write("htmlFile.txt", Syntax.format(elem(:lexer.string('area = pi * radio ** 2'),1)))
  end

  # def write(tokens) do
  #   htmlStr = format((tokens))
  #   File.write("htmlFile.txt", htmlStr)
  # end

end
