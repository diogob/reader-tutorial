module TransformerSpec (spec) where

import Test.Hspec
import Control.Monad.Reader
import Data.IORef

import Config
import Transformer

spec :: Spec
spec =
    describe "Transformer" $ do
        describe "printPrice" $
            it "Creates message using prices from API" $
                pendingWith "Create a spec for printPrice similar to printCurrency bellow and then implement Transformer.printCurrency"

        describe "printCurrency" $
            it "Creates message using currency configuration from context" $ do
                result <- newIORef ""
                let 
                    config = Config "BTC" True
                    writeString = writeIORef result
                context <- makeContextWithConfig writeString config
                runReaderT printCurrency context
                resultString <- readIORef result
                resultString `shouldBe` "The currency given to App is BTC"