defmodule ExRemoteOK do

  alias ExRemoteOK.API

  defdelegate fetch_latest_jobs, to: API
end
