-module(jmus_view_index).
-include("../../../include/trans.hrl").
-compile(export_all).

junk() -> "Some ideas by Burroughs".

%%---------------------------------------------------------------------------

start() ->
  Output = mustache:render(complex, "../complex.mustache"),
  io:format(Output, []).
