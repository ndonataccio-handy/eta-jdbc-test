{-# LANGUAGE OverloadedStrings #-}
module Main where

import Java
import Jdbc

-- Connect to Apache Derby embedded by path
connectDB :: String -> IO Jdbc.Connection
connectDB path = Jdbc.connect (path) "" ""

data Stuff = Stuff { name :: String} deriving Show

instance ResultRow Stuff where
  parseResultRow rs = do
    name <- getString rs "count"
    return $ Stuff { name = name }

main = do
  con <- connectDB "jdbc:hive2://r-hadoopeco-hive-0d215a95.hbinternal.com:10000/handybook_transactional"
  count <- query con "select count(*) as count from booking" []
  printIt count
  where
    printIt :: [Stuff] -> IO ()
    printIt c = putStrLn $ show c
