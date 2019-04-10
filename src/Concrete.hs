{-# LANGUAGE FlexibleContexts #-}

module Concrete
    ( getCurrency
    ) where

import Config
import Control.Monad.Reader

getCurrency :: Reader Config String
getCurrency = do 
    config <- ask
    pure $ "The currency given to Reader is " <> currency config
