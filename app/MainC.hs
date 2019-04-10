module Main where

import Config
import qualified Concrete as C

import Control.Monad.Reader

main :: IO ()
main = do
    config <- Config.load
    print $ runReader C.getCurrency config
    
