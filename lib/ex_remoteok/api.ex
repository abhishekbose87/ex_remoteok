require Logger

defmodule ExRemoteOK.API do
  @url "https://remoteok.io/api"

  def fetch_latest_jobs() do
    [ _legal | jobs] = fetch_api_data()
    jobs
  end

  defp fetch_api_data() do
    Logger.info "Making HTTP request to #{@url}"
    case HTTPoison.get(@url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode!(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        Logger.error "404 Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error reason
    end
  end

end
