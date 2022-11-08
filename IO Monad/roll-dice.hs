import System.Random
import Control.Monad (replicateM)

minDie :: Int 
minDie = 1

maxDie :: Int
maxDie = 6

main :: IO ()
main = do
    dieRoll <- randomRIO (minDie,maxDie)
    putStrLn (show dieRoll)
    replicateM 10 (randomIO :: IO Float) >>= print
    