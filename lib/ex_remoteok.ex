defmodule ExRemoteOK do

  alias ExRemoteOK.Cache

  defdelegate fetch_latest_jobs, to: Cache
end
