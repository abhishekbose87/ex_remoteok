defmodule ExRemoteOK.Application do

  use Application

  def start(_type, _args) do

    import Supervisor.Spec

    children = [
      worker(ExRemoteOK.Cache, []),
      worker(ExRemoteOK.Updater, [])
    ]

    options = [
      name: ExRemoteOK.Supervisor,
      strategy: :one_for_one,
    ]

    Supervisor.start_link(children, options)
  end

end
