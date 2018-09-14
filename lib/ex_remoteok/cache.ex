defmodule ExRemoteOK.Cache do

  use Agent

  @me __MODULE__

  def start_link() do
    Agent.start_link(&init/0, name: @me)
  end

  def init do
    ExRemoteOK.API.fetch_latest_jobs()
  end

  def fetch_latest_jobs() do
    Agent.get(@me, fn(state) ->
      state
    end)
  end

  def update do
    Agent.update(@me, fn(_state) ->
      ExRemoteOK.API.fetch_latest_jobs()
    end)
  end

end
