IO.puts("----------------------")

  Benchee.run(
    %{
      "syntaxConcurrente" => fn -> Syntax.syntaxConcurrent() end,
      "syntaxSecuencial" => fn -> Syntax.syntaxSequential() end
    }
  )

IO.puts("--DONE--")
