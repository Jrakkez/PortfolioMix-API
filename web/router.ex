defmodule Mixer.Router do
  use Mixer.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Mixer do
    pipe_through :api
    #Route stuff to SessionController
    resources "/session", SessionController, only: [:index]
  end
end
