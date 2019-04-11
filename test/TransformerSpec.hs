module TransformerSpec (spec) where

import Test.Hspec
import Control.Monad.Reader
import Data.IORef

import CoinberryApi
import Config
import Transformer

spec :: Spec
spec =
    describe "Transformer" $ do
        describe "printPrice" $
            it "Creates message using prices from API" $ do
                result <- newIORef ""
                let
                    config = Config "BTC" True
                    writeString = writeIORef result
                context <- makeContextWithConfig writeString (const (pure $ Price "42" "23")) config 
                runReaderT printPrice context
                resultString <- readIORef result
                resultString `shouldBe` "The price of BTC is 23"

        describe "printCurrency" $
            it "Creates message using currency configuration from context" $ do
                result <- newIORef ""
                let
                    config = Config "BTC" True
                    writeString = writeIORef result
                context <- makeContextWithConfig writeString (\currency -> pure $ Price "42" "23") config 
                runReaderT printCurrency context
                resultString <- readIORef result
                resultString `shouldBe` "The currency given to App is BTC"
