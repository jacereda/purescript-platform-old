-- | Platform detection functionality.
module Data.Platform( Platform(..)
                    , OS(..)
                    , platform
                    , parse
                    ) where


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

foreign import wrapPlatformImpl
"""
function wrapPlatformImpl(just) {
  return function(nothing) {
    return function(p) {
    var toMaybe = function(x) { return x? just(x) : nothing; }
    return { description: ''+p.description
           , layout: toMaybe(p.layout)
           , manufacturer: toMaybe(p.manufacturer)
           , name: toMaybe(p.name)
           , prerelease: toMaybe(p.prerelease)
           , product: toMaybe(p.product)
           , ua: toMaybe(p.ua)
           , version: toMaybe(p.version)
           , os: { architecture: toMaybe(p.os.architecture)
                 , family: toMaybe(p.os.family)
                 , version: toMaybe(p.os.version)
                 , description: '' + p.os
                 }
           };
    };
  };
}
""" :: forall a. (a -> Maybe a) -> Maybe a -> NPlatform -> Platform
wrapPlatform :: NPlatform -> Platform
wrapPlatform = wrapPlatformImpl Just Nothing

foreign import platformImpl
"""
var platformImpl = require('platform');
""" :: NPlatform

-- | Guessed `Platform` corresponding to the underlying VM.
platform :: Platform
platform = wrapPlatform platformImpl

foreign import parseImpl
"""
function parseImpl(ua) {
  return require('platform').parse(ua);
}
""" :: String -> NPlatform


-- | Guessed `Platform` corresponding to a User Agent string.
parse :: String -> Platform
parse = wrapPlatform <<< parseImpl
