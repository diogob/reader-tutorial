module TransformerSpec (spec) where

import Test.Hspec
import Control.Monad.Reader
import Data.IORef

import Config
import Transformer

spec :: Spec
spec =
    describe "printURI" $
        it "Creates message using URI configuration from context" $ do
            result <- newIORef ""
            let 
                config = Config "test-uri" True
                writeString = writeIORef result
            context <- makeContextWithConfig writeString config
            runReaderT printURI context
            resultString <- readIORef result
            resultString `shouldBe` "The URI given to App is test-uri"