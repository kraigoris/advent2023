defmodule Input do
  defmacro __using__(_opts \\ []) do
    quote do
      def input_lines() do
        String.split(input_text(), "\n", trim: true)
      end

      def input_text() do
        require Logger
        path = input_path()

        case File.read(path) do
          {:ok, text} ->
            text

          {:error, e} ->
            Logger.warning("input file not found at #{inspect(path)}")
            ""
        end
      end

      def input_path() do
        __ENV__.file
        |> Path.dirname()
        |> then(&[&1, "..", "input.txt"])
        |> Path.join()
        |> Path.expand()
      end
    end
  end
end
