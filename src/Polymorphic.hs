{-# LANGUAGE FlexibleContexts #-}

module Polymorphic
    ( printURI
    , printQuiet
    ) where

import Config
import Control.Monad.Reader.Class
import Control.Monad.IO.Class
import Control.Monad.Reader

type App = ReaderT Config IO

printURI :: (MonadReader Config m, MonadIO m) => m ()
printURI = do 
    config <- ask
    liftIO $ print $ "The URI given to App is " <> uri config

printQuiet :: (MonadReader Config m, MonadIO m) => m ()
printQuiet = do
    config <- ask
    liftIO $ print $ "The QUIET switch given to App is " <> show (quiet config)
