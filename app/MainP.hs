module Main where

import qualified Config as C
import qualified Polymorphic as P

import Control.Monad.Reader

main :: IO ()
main = do
    context <- C.makeContext print
    flip runReaderT context $ do
        P.printURI 
        P.printQuiet