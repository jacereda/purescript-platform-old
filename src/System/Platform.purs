module System.Platform( Platform(..)
                    , OS(..)
                    , platform
                    , parse
                    ) where

import Prelude
import Data.Maybe

-- | Guessed platform properties.
type Platform = { description :: String 
                , layout :: Maybe String
                , manufacturer :: Maybe String
                , name :: Maybe String
                , prerelease :: Maybe String
                , product :: Maybe String
                , ua :: Maybe String
                , version :: Maybe String
                , os :: OS
                }

-- | Guessed operating system properties.
type OS = { description :: String
          , architecture :: Maybe Number
          , family :: Maybe String
          , version :: Maybe String
          }

foreign import data NPlatform :: *

foreign import wrapPlatformImpl :: forall a. (a -> Maybe a) -> Maybe a -> NPlatform -> Platform

wrapPlatform :: NPlatform -> Platform
wrapPlatform = wrapPlatformImpl Just Nothing

foreign import platformImpl :: NPlatform

-- | Guessed `Platform` corresponding to the underlying VM.
platform :: Platform
platform = wrapPlatform platformImpl

foreign import parseImpl :: String -> NPlatform

-- | Guessed `Platform` corresponding to a User Agent string.
parse :: String -> Platform
parse = wrapPlatform <<< parseImpl
