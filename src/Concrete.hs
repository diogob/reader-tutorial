{-# LANGUAGE FlexibleContexts #-}

module Concrete
    ( getURI
    ) where

import Config
import Control.Monad.Reader

getURI :: Reader Config String
getURI = do 
    config <- ask
    pure $ "The URI given to Reader is " <> uri config
