module CoinberryApi ( price
                    , Currency (..)
                    ) where

import Control.Monad.IO.Class
import Data.Aeson
import Network.HTTP.Req
import qualified Data.Text as T

price :: MonadIO m => Currency -> m Price
-- price baseCurrency = undefined
price baseCurrency = do 
     j <- runReq defaultHttpConfig $
         req GET (https "api.coinberry.com" /: "prices" /: "CAD" /: T.pack (show baseCurrency)) NoReqBody jsonResponse mempty
     pure $ responseBody j

data Price = 
    Price { sell :: String
          , buy :: String 
          } deriving (Show)

instance FromJSON Price where
    parseJSON = 
        withObject "Price" $ \obj ->
            Price <$> ((obj .: "data") >>= (.: "sell"))
                  <*> ((obj .: "data") >>= (.: "buy"))


data Currency = CAD | BTC | ETH | LTC | XRP 
    deriving (Show)
