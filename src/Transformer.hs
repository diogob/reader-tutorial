{-# LANGUAGE FlexibleContexts #-}

module Transformer
    ( printURI
    , printQuiet
    ) where

import Config
import Control.Monad.Reader

type App = ReaderT Config IO

printURI :: App ()
printURI = do 
    config <- ask
    liftIO $ print $ "The URI given to App is " <> uri config

printQuiet :: App ()
printQuiet = do
    config <- ask
    liftIO $ print $ "The QUIET switch given to App is " <> show (quiet config)
