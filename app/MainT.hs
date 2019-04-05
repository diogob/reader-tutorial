module Main where

import qualified Config as C
import qualified Transformer as T

import Control.Monad.Reader

main :: IO ()
main = do
    context <- C.makeContext print
    flip runReaderT context $ do
        T.printURI 
        T.printQuiet