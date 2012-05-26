-module(jmus_helloworld).
-behaviour(cowboy_http_handler).
-export([init/3, handle/2, terminate/2]).

init({_Any, http}, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	AbsolutePath = "/home/sweater/github/mine/junkyard-mustache/",
	{ok, Req2} = cowboy_http_req:reply(200, [], mustache:render(jmus_view_index, AbsolutePath ++ "index.mustache"), Req),
	{ok, Req2, State}.

terminate(_Req, _State) ->
	ok.
