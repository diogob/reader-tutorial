module Config 
    ( load
    , Config(..)
    ) where

import Env
import Control.Monad.IO.Class

data Config =
    Config 
    { uri :: String 
    , quiet :: Bool 
    } deriving (Show, Eq)

load :: (MonadIO m) => m Config
load = 
        liftIO $ 
        Env.parse (header "Reader Tutorial") $
        Config <$> var (str <=< nonempty) "URI" (help "URI to fetch data from")
                <*> switch "QUIET" (help "Suppress debug information")