module Main where

import qualified Config as C
import qualified Transformer as T

import CoinberryApi
import Control.Monad.Reader

main :: IO ()
main = do
    context <- C.makeContext print price
    flip runReaderT context $ do
        T.printCurrency
        T.printPrice
