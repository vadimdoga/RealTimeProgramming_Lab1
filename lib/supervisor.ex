defmodule Supervisor_1 do

  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(init_arg) do
    import Supervisor.Spec

    children = [
      worker(Fetch, [init_arg]),
      worker(Root, [:arg]),
      worker(Forecast, [:arg]),
      supervisor(DynSupervisor, [:arg])
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end