defmodule Syntax do
  # :lexer.string('area = pi * radio ** 2')
  # Syntax.format(elem(:lexer.string('area = pi * radio ** 2'),1))

  def main(file) do
    File.read!(file)
    |> String.replace("'","\'")
    |> String.to_charlist()
    |> syntax()
    |> IO.puts
  end

  def syntax(text) do
    htmlStr = format(elem(:lexer.string(text),1))
    _intoHTML = File.write("htmlFinal.html", htmlStr) #Ponemos el resultado en un archivo
    htmlStr
  end

  def format(tokens) do

    htmlUpPart = "
    <!DOCTYPE html>
      <html lang='en'>
        <head>
          <meta charset='UTF-8' />
          <meta name='viewport' content='width=device-width, initial-scale=1.0' />
          <meta http-equiv='X-UA-Compatible' content='ie=edge' />
          <title>Syntax highlighter for C++</title>

          <script
            src='https://kit.fontawesome.com/96bb550736.js'
            crossorigin='anonymous'
          ></script>
          <link
            rel='stylesheet'
            href='https://fonts.googleapis.com/css?family=Fira Mono'
          />
          <link rel='preconnect' href='https://fonts.googleapis.com' />
          <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin />
          <link
            href='https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap'
            rel='stylesheet'
          />

          <style>
            * {
              padding: 0;
              margin: 0;
              box-sizing: border-box;
            }

            html {
              /* font-size: 10px; */
              /* 10px / 16px = 0.625 = 62.5% */
              /* Percentage of user's browser font-size setting */
              font-size: 62.5%;
              overflow-x: hidden;
            }

            ::selection {
              background: #434957;
            }

            body {
              line-height: 1;
              font-weight: 300;
              font-family: 'Montserrat', sans-serif;
              overflow-x: hidden;
            }

            header {
              height: 15vh;
              background-color: #1d1f25;

              color: #f3f3f3;

              display: flex;
              justify-content: center;
              align-items: center;
              gap: 1rem;
            }

            header h1 {
              font-size: 3.6rem;
              font-weight: 600;
            }

            header h1 strong {
              font-size: 3rem;
              font-weight: 500;
            }

            main {
              font-size: 1.8rem;
              background-color: #282c34;

              min-height: 78vh;
              padding-left: 5rem;
              padding-top: 5rem;
            }

            main .container code pre {
              line-height: 1.5;
              font-family: Menlo, Consolas, DejaVu Sans Mono, monospace;
            }

            footer {
              height: 7vh;
              background-color: #252930;
              color: #f3f3f3;

              display: flex;
              justify-content: space-between;
              align-items: center;
            }

            footer .container-names {
              margin-left: 5rem;

              font-size: 1.2rem;
            }

            footer .container-icon {
              margin-right: 5rem;
            }

            footer .container-icon a {
              color: #f3f3f3;
              font-size: 2.6rem;

              transition: all 0.2s;
            }

            footer .container-icon a:hover {
              color: #2684ff;
            }

            /* ------------------------- */
            /* STYLES FOR THE CODE */
            /* ------------------------- */

            :root {
              --number: #d19a66;
              --string: #98c379;
              --normal: #abb2bf;
              --keyword: #c678dd;
              --builtin: #56b6c2;
              --definition: #61afef;
              --comment: #5c6370;
              --ocurrence: #434957;
            }

            span {
              white-space: pre;
              color: var(--normal);
              display: inline;
            }

            .comment {
              color: var(--comment);
              font-style: italic;
            }

            .data-type {
              color: var(--builtin);
            }

            .int,
            .float,
            .keyword-bool {
              color: var(--number);
            }

            .string,
            .char,
            .header {
              color: var(--string);
            }

            .conditional,
            .assign,
            .arithmetic,
            .relation,
            .logical,
            .punctuation-color,
            .include,
            .keyword {
              color: var(--keyword);
            }

            .group,
            .punctuation,
            .identifier {
              color: var(--normal);
            }

            .function {
              color: var(--definition);
            }
          </style>
          <script src='js/script.js'></script>
        </head>
        <body>
          <header>
            <h1>Syntax highlighter <strong>for C++</strong></h1>
          </header>

          <main>
            <div class='container'>
              <code>
                <pre id='insert'>"

    htmlDownPart = "
              </pre>
              </code>
            </div>
          </main>

          <footer>
            <div class='container-names'>
              Copyright © 2022 by Carlos Díaz & José Á. González
            </div>
            <div class='container-icon'>
              <a
                target='_blank'
                href='https://bitbucket.org/di-az/syntaxhighlighter/src/main/syntax/'
                ><i class='fa-brands fa-bitbucket'></i
              ></a>
            </div>
          </footer>
        </body>
      </html>
    "

    htmlGenerated = Enum.map(tokens, fn {token, tchars} ->
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

    htmlMiddlePart = Enum.join(htmlGenerated)

    htmlUpPart <> htmlMiddlePart <> htmlDownPart

  end


end
