## Module System.Platform

#### `Platform`

``` purescript
type Platform = { description :: String, layout :: Maybe String, manufacturer :: Maybe String, name :: Maybe String, prerelease :: Maybe String, product :: Maybe String, ua :: Maybe String, version :: Maybe String, os :: OS }
```

Guessed platform properties.

#### `OS`

``` purescript
type OS = { description :: String, architecture :: Maybe Number, family :: Maybe String, version :: Maybe String }
```

Guessed operating system properties.

#### `platform`

``` purescript
platform :: Platform
```

Guessed `Platform` corresponding to the underlying VM.

#### `parse`

``` purescript
parse :: String -> Platform
```

Guessed `Platform` corresponding to a User Agent string.


