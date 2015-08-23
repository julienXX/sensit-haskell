{-# LANGUAGE OverloadedStrings #-}

module Sensit where

import Network.Wreq
import Control.Lens
import Data.Map as Map
import Data.Aeson (Value)
import Data.Aeson.Lens (key)

type Resp = Response (Map String Value)
