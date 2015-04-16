module Test.Main where

import Debug.Trace
import Data.Platform
import Data.Maybe
import Data.Array
import Control.Monad.Eff


main = do
  let p = platform
      p' = parse $ fromMaybe "" platform.ua
      ps = [p, p']
      dump :: forall a. (Show a) => String -> (Platform -> a) -> Eff (trace :: Trace) Unit
      dump s f = trace $ s ++ ": " ++ show (f <$> ps)
  dump "description" _.description
  dump "layout" _.layout
  dump "manufacturer" _.manufacturer
  dump "name" _.name
  dump "prerelease" _.prerelease
  dump "product" _.product
  dump "ua" _.ua
  dump "version" _.version
  dump "os.description" $ _.os >>> _.description
  dump "os.architecture" $ _.os >>> _.architecture
  dump "os.family" $ _.os >>> _.family
  dump "os.version" $ _.os >>> _.version
