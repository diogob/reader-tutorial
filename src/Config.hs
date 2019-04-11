{-# LANGUAGE RankNTypes #-}
module Config 
    ( makeContext
    , makeContextWithConfig
    , Context (..)
    , Config (..)
    , load
    ) where

import CoinberryApi
import Env
import Control.Monad.IO.Class

-- | Everything the functions running in App will need should be in this type. Add all functions that will be mocked out during testing. 
data Context =
    Context { ctxPrint :: String -> IO ()
            , ctxConfig :: Config
            , ctxPrice :: Currency -> IO Price
            }

-- | This will load Config from OS environment variables. Change this to implement the `price` executable.
makeContext :: MonadIO m => (String -> IO ()) -> (Currency -> IO Price) -> m Context
makeContext p priceFn =
    load >>= makeContextWithConfig p priceFn

-- | This will build a Context with a given Config, useful for testing.
makeContextWithConfig :: MonadIO m => (String -> IO ()) -> (Currency -> IO Price) -> Config -> m Context
makeContextWithConfig printFn priceFn config = 
    pure $ Context printFn config priceFn

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
