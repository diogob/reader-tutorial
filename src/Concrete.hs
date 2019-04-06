{-# LANGUAGE FlexibleContexts #-}

module Concrete
    ( getURI
    ) where

import Config
import Control.Monad.Reader

getURI :: Reader Config String
getURI = do 
    config <- ask
    pure $ "The currency given to Reader is " <> currency config
