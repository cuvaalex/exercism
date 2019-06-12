%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Apr 2017 3:35 PM
%%%-------------------------------------------------------------------
-module(accumulate).
-author("alex").

%% API
-export([test_version/0, accumulate/2]).

test_version()
  -> 1.

accumulate(_Fn, [])
  -> [];
accumulate(Fn, Ls)
  -> [Fn(X) || X <- Ls].
%%accumulate(Fn, Ls) -> [Fn(hd(Ls)) | accumulate(Fn, tl(Ls))].
