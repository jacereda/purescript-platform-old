# Module Documentation

## Module Data.Platform


Platform detection functionality.

#### `Platform`

``` purescript
type Platform = { os :: OS, version :: Maybe String, ua :: Maybe String, product :: Maybe String, prerelease :: Maybe String, name :: Maybe String, manufacturer :: Maybe String, layout :: Maybe String, description :: String }
```

Guessed platform properties.

#### `OS`

``` purescript
type OS = { version :: Maybe String, family :: Maybe String, architecture :: Maybe Number, description :: String }
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



