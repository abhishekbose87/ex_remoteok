# ExRemoteOK
Elixir application for [RemoteOK](https://remoteok.io/) api

## Features

- Inbuilt cache for storing HTTP results in order to avoid unnecessary HTTP requests
- Recurring task which updates cache every 24 hours
- Application restarts due to any failure in cache or update job

## How to use it

Add `ex_remoteok` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_remoteok, git: "https://github.com/abhishekbose87/ex_remoteok.git" }
  ]
end
```

```bash
mix deps.get
iex -S mix
```

```bash
iex> ExRemoteOK.get_latest_jobs
[ <jobs> ]
```

## TODO

- Error handling
- Documentation
- Add more features based on tags etc
