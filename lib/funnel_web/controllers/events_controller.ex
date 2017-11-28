defmodule FunnelWeb.EventsController do
  use FunnelWeb, :controller
  alias Funnel.Investigator

  def receive(conn, _params) do
    Task.start_link fn -> Investigator.investigate(Funnel.Scent.get_scent(conn.body_params)) end
    text conn, "Thanks!"
  end

end
