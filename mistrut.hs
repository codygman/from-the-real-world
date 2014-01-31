{-# LANGUAGE OverloadedStrings #-}
import Data.Csv
import System.FilePath
import qualified Data.Text.Lazy as T
import qualified Data.Text.Encoding as E
import qualified Data.ByteString.Lazy as BS
import qualified Data.ByteString.Lazy.Char8 as BLC
import qualified Data.Vector as V

-- compose all csv pre-processing functions together
clean :: T.Text -> T.Text
clean = fixQuoting

-- Our malformed csv file uses '\"' to escape " within a text quoted column
-- it should use "" as per rfc: rwww.rfc-editor.org/rfc/rfc4180.txt
fixQuoting :: T.Text -> T.Text
fixQuoting = T.replace ("\\\"") ("\"\"")

main :: IO ()
main = do
  let filename = "test1.csv"
  input <- BS.readFile filename
  let parsedCsv = decode NoHeader input :: Either String (V.Vector (V.Vector BLC.ByteString))
  case parsedCsv of
    Left err -> putStrLn err
    Right v ->  putStrLn $ "There are " ++ show (V.length v) ++ " rows in " ++ show filename
