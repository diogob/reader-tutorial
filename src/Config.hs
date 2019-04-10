{-# LANGUAGE RankNTypes #-}
module Config 
    ( makeContext
    , makeContextWithConfig
    , Context (..)
    , Config (..)
    , load
    ) where

import Env
import Control.Monad.IO.Class

data Context =
    Context { ctxPrint :: String -> IO ()
            , ctxConfig :: Config
            }

makeContext :: MonadIO m => (String -> IO ()) -> m Context
makeContext p =
    load >>= makeContextWithConfig p

makeContextWithConfig :: MonadIO m => (String -> IO ()) -> Config -> m Context
makeContextWithConfig printFn config = 
    pure $ Context printFn config
    
-- private
data Config =
    Config 
    { currency :: String 
    , quiet :: Bool 
    } deriving (Show, Eq)

load :: (MonadIO m) => m Config
load = 
        liftIO $ 
        Env.parse (header "Reader Tutorial") $
        Config <$> var (str <=< nonempty) "CURRENCY" (help "CURRENCY to fetch price from")
                <*> switch "QUIET" (help "Suppress debug information")