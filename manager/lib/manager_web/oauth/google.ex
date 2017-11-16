defmodule Google do
  @moduledoc """
  An OAuth2 strategy for Google.
  """
  use OAuth2.Strategy

  require Logger

  alias OAuth2.Strategy.AuthCode

  # Public API

  def client do
    OAuth2.Client.new([
        strategy: Google,
        site: "https://accounts.google.com",
        authorize_url: "/o/oauth2/auth",
        token_url: "/o/oauth2/token",

        #google api
        client_id: "113870760288-2vqb75bgh0ckm0sjo9lj8oi2t0eaue3t.apps.googleusercontent.com",
        client_secret: "IzZGBSBy3pmUOhCgtp_v7VCs",

        # #google cal apiKey
        # client_id: "113870760288-vjo6vgfavr4gg6tg2s8elm2r8e4qjp2d.apps.googleusercontent.com",
        # client_secret: "ktFAM_8AHsIPwZJ8DxsdD4g7",
        # api_key: "AIzaSyCpA-b0Yx6r6Qf2vH2wlYNg8p4Up-oPL18",
        redirect_uri: "http://manager.cristinetchen.com/auth/google/callback"
      ])
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(client(), params)
  end

  def get_token!(params \\ [], headers \\ []) do
    Logger.info "waht's in the client #{inspect client()}"
    OAuth2.Client.get_token!(client(), params, headers)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end
end
