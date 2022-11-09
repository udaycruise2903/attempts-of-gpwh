module Main (main) where

import qualified Data.Map as Map

data Tool = Tool
  { name :: String
  , description :: String
  , cost :: Double
  , count :: Int
  } deriving Show

type Html = String

renderHtml :: Tool -> Html
renderHtml tool = mconcat ["<h2>",toolName,"</h2>"
                          ,"<p><h3>desc</h3>",toolDesc
                          ,"</p><p><h3>cost</h3>"
                          ,toolCost
                          ,"</p><p><h3>count</h3>"
                          ,toolCount,"</p>"
                          ]
  where toolName = name tool
        toolDesc = description tool
        toolCost = show (cost tool)
        toolCount = show (cost tool)

ScrewDriver :: Tool
ScrewDriver = ScrewDriver
  { name = "Screw Driver"
  , description = "left arm for face punching!"
  , cost = 400.00
  , count = 3
  }

SledgeHammer :: Tool
SledgeHammer = SledgeHammer
    { name = "Sledge Hammer"
    , description = "right arm for kind hand gestures"
    , cost = 625.00
    , count = 5
    }
  
DrillComboKit :: Tool
DrillComboKit = DrillComboKit
    { name = "Drill Combo Kit"
    , description = "this head looks mad"
    , cost = 5092.25
    , count = 2
    }

toolsDB :: Map.Map Int tool
toolsDB = Map.fromList keyVals
  where keys = [1,2,3]
        vals = [ScrewDriver,SledgeHammer,DrillComboKit]
        keyVals = zip keys vals

toolVal :: Maybe tool
toolVal = Map.lookup 1 toolsDB

toolHtml :: Maybe Html
toolHtml = renderHtml <$> toolVal

tools :: [tool]
tools = snd <$> (Map.toList toolsDB)

allToolsHtml :: [Html]
allToolsHtml = renderHtml <$> tools

htmlToolsDB = Map.Map Int Html
htmlToolsDB = renderHtml <$> toolsDB

ScrewDriverIO :: IO Tool
ScrewDriverIO = return ScrewDriver

htmlSnippet :: IO Html
htmlSnippet = renderHtml <$> ScrewDriverIO  

main :: IO ()
main = do
  putStrLn "factory"
  print htmlSnippet