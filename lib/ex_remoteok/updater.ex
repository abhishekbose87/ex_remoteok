require Logger

defmodule ExRemoteOK.Updater do
  use Task
  @me __MODULE__
  @time 24 * 60 * 60_000 # 24 hours

  def start_link() do
    Logger.info "Process #{inspect(self())} #{@me} started"
    Task.start_link(&poll/0)
  end

  def poll() do
    receive do
    after
       @time ->
        spawn_link(&update_price/0)
        poll()
    end
  end

  defp update_price() do
    :ok = ExRemoteOK.Cache.update
    Logger.info "Process #{inspect(self())} #{@me} ran"
  end
end
