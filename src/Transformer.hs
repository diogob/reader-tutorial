{-# LANGUAGE FlexibleContexts #-}

module Transformer
    ( printCurrency
    , printQuiet
    , printPrice
    ) where

import Config
import Control.Monad.Reader

type App = ReaderT Context IO

-- | Function to be implemented.
printPrice :: App ()
printPrice = error "please implement printPrice to fetch currency price"

-- | Using the configuration and print function from Context will print the Currency
printCurrency :: App ()
printCurrency = do
    ctx <- ask
    liftIO $ ctxPrint ctx $ "The currency given to App is " <> currency (ctxConfig ctx)

printQuiet :: App ()
printQuiet = do
    ctx <- ask
    liftIO $ print $ "The QUIET switch given to App is " <> show (quiet $ ctxConfig ctx)
