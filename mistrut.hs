import qualified Data.Text as T
import qualified Data.Text.Encoding as E
import qualified Data.ByteString as BS
import System.FilePath
import Text.CSV

-- compose all csv pre-processing functions together
clean :: T.Text -> T.Text
clean = fixQuoting

-- Our malformed csv file uses '\"' to escape " within a text quoted column
-- it should use "" as per rfc: rwww.rfc-editor.org/rfc/rfc4180.txt
fixQuoting :: T.Text -> T.Text
fixQuoting = T.replace (T.pack "\\\"") (T.pack "\"\"")

main :: IO ()
main = do
  input <- BS.readFile "impossible-to-parse.csv" :: IO BS.ByteString
  let cleaned_input = clean $ E.decodeUtf8 input
  let error_fp = "" </> "errors.txt"
  let parsed_data = parseCSV error_fp $ T.unpack cleaned_input
  case parsed_data of
    Left _ -> error "something went wrong"
    Right results -> do
                     let fields = head results :: [Field]
                     putStrLn $ show $ length fields

