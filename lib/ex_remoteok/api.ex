defmodule ExRemoteOK.API do

  def fetch_latest_jobs() do
    [ _legal | jobs] = fetch_api_data()
    jobs
  end

  defp fetch_api_data() do
    url = "https://remoteok.io/api"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode!(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

end
