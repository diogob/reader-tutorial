module Main where

import qualified Config as C
import qualified Polymorphic as P

import Control.Monad.Reader

main :: IO ()
main = do
    config <- C.load
    flip runReaderT config $ do
        P.printURI 
        P.printQuiet