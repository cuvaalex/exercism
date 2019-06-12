%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Apr 2017 2:33 PM
%%%-------------------------------------------------------------------
-module(leap).
-author("alex").

%% API
-export([test_version/0, leap_year/1]).

%% leap_year(Year)  = true|false
leap_year(Year) when is_integer(Year), Year >= 0
  -> is_year_leap(Year).

is_year_leap(Y) when Y rem 4 =:= 0, Y rem 100 > 0
  -> true;

is_year_leap(Y) when Y rem 400 =:= 0
  -> true;
is_year_leap(_) -> false.

test_version() -> 1.
