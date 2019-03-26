module Main where

import qualified Config as C
import qualified Transformer as T

import Control.Monad.Reader

main :: IO ()
main = do
    config <- C.load
    flip runReaderT config $ do
        T.printURI 
        T.printQuiet