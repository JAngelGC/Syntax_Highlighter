defmodule Syntax do
  # :lexer.string('area = pi * radio ** 2')
  # Syntax.format(elem(:lexer.string('area = pi * radio ** 2'),1))

  def read(file) do
    File.read!(file)
    |> String.replace("'","\'")
    |> String.to_charlist()
    |> syntax()

    # ff = File.read!(file)
    # text = String.replace(ff,"'","\'")
    # result = String.to_charlist(text)
    # IO.inspect(result)
    # syntax(result)
  end

  def syntax(text) do
    htmlStr = format(elem(:lexer.string(text),1))
    File.write("htmlFile.txt", htmlStr) #Ponemos el resultado en un archivo
  end

  def format(tokens) do
    Enum.map(tokens, fn {token, tchars} ->
      tchars = List.to_string(tchars)
      tchars = String.replace(tchars, "\'","'")
      tchars = HtmlEntities.encode(tchars)
      # IO.puts(tchars)
      case token do
        # WHITESPACE
        :space -> "<span class='space'>#{tchars}</span>"
        :newline -> "<span class='newline'><br></span>"

        # COMMENTS
        :comment -> "<span class='comment'>#{tchars}</span>"

        # DATA
        :data_type -> "<span class='data-type'>#{tchars}</span>"
        :int -> "<span class='int'>#{tchars}</span>"
        :float -> "<span class='float'>#{tchars}</span>"
        :string -> "<span class='string'>#{tchars}</span>"
        :char -> "<span class='char'>#{tchars}</span>"
        :keywordBool -> "<span class='keyword-bool'>#{tchars}</span>"

        # CONDITIONALS
        :conditional -> "<span class='conditional'>#{tchars}</span>"

        # OPERATORS
        :assign -> "<span class='assign'>#{tchars}</span>"
        :arithmetic -> "<span class='arithmetic'>#{tchars}</span>"
        :relation -> "<span class='relation'>#{tchars}</span>"
        :logical -> "<span class='logical'>#{tchars}</span>"

        # GROUPS
        :group -> "<span class='group'>#{tchars}</span>"

        # PUNCTUATION
        :punctuationColor -> "<span class='punctuation-color'>#{tchars}</span>"
        :punctuation -> "<span class='punctuation'>#{tchars}</span>"

        # HEADERS
        :include -> "<span class='include'>#{tchars}</span>"
        :header -> "<span class='header'>#{tchars}</span>"


        :keyword -> "<span class='keyword'>#{tchars}</span>"

        # IDENTIFIERS AND FUNCTIONS
        # TODO: Parse function name from opening parentheses
        :function -> "<span class='function'>#{String.replace(tchars,"(","")}</span><span class='group'>(</span>"
        :identifier -> "<span class='identifier'>#{tchars}</span>"
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
