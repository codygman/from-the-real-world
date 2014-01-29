import Text.CSV
import Data.String.Utils
import System.FilePath

-- compose all csv pre-processing functions together
clean :: String -> String
clean = fixQuoting

-- Our malformed csv file uses '\"' to escape " within a text quoted column
-- it should use "" as per rfc: rwww.rfc-editor.org/rfc/rfc4180.txt
fixQuoting :: String -> String
fixQuoting = replace "\\\"" "\"\""

main :: IO ()
main = do
  input <- readFile "contractor-customer-scrape-data.csv"
  let cleaned_input = clean input
  let error_fp = "." </> "errors.txt"
  let parsed_data = parseCSV error_fp cleaned_input
  case parsed_data of
    Left _ -> error "something went wrong"
    Right results -> do
                     putStrLn $ printCSV results

