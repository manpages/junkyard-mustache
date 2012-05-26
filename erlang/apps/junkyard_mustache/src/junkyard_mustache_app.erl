-module(junkyard_mustache_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
	application:start(crypto),
	application:start(public_key),
	application:start(ssl),
	application:start(cowboy),
	application:start(cowboy_examples).

start(_Type, _Args) ->
Dispatch = [
		{'_', [
			%%{[<<"type">>, <<"args">>], jmus_type_handler, [<<"args">>]},
			{'_', jmus_helloworld, []}
		]}
	],
	cowboy:start_listener(jmus_listener, 100,
		cowboy_tcp_transport, [{port, 5659}],
		cowboy_http_protocol, [{dispatch, Dispatch}]
	),
    junkyard_mustache_sup:start_link().

stop(_State) ->
    ok.
