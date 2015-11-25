module Database.Nedb
    ( Config, Client(..)
    , Operation
    , createClient, createClientFromConfigFile
    , insert, find
    )
    where
{-| Wrappers around Nedb for Node

@docs Config, Client, Operation

@docs createClient, createClientFromConfigFile

@docs insert

@docs find
-}
import Task exposing (Task)

import Native.Database.Nedb

{-| empty config -}
type alias Config = { }

{-| standard client -}
type Client =
    Client

type alias Operation a b =
    a -> Client -> Task String b

{-| Create a client using the given record as an options object
-}
createClient : Config -> Client
createClient =
    Native.Database.Nedb.createClient

{-| Create a client using the given filename for a json file
as an options object
-}
createClientFromConfigFile : String -> Client
createClientFromConfigFile =
    Native.Database.Nedb.createClientFromConfigFile

{-| Insert documents into the client database

-}
insert : Operation a b
insert =
    Native.Database.Nedb.insert

{-|
    Takes a record with given fields and attempts to search for them
-}
find : Operation a (List b)
find =
    Native.Database.Nedb.find
