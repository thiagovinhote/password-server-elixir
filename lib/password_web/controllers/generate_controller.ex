defmodule PasswordWeb.GenerateController do
  use PasswordWeb, :controller

  alias Password.Generate

  def create(conn, params) do
    params
    |> Generate.random()
    |> handle_response(conn)
  end

  defp handle_response({:ok, payload}, conn), do: render_response(conn, payload, :ok)

  defp handle_response({:error, payload}, conn), do: render_response(conn, payload, :bad_request)

  defp render_response(conn, payload, status) do
    conn
    |> put_status(status)
    |> json(%{result: payload})
  end
end
