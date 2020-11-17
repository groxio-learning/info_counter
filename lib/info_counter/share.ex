defmodule InfoCounter.Share do
  def share(name, new_count) do
    pid = Process.whereis(name)
    send(pid, {:share, new_count})
  end
end