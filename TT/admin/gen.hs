import qualified Data.ByteString as B
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    contents <- B.readFile $ args !! 0
    B.writeFile "reverse.jpg" $ B.reverse contents
