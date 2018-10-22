{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
module Frontend where

import qualified Data.Text as T
import Reflex.Dom.Core
import           Reflex.Dom.ACE                    as ACE
import Data.Monoid

import Common.Api
import Static

frontend :: (StaticWidget x (), Widget x ())
frontend = (head', body)
  where
    head' = do
      el "title" $ text "Obelisk Minimal Example"
      elAttr "script" ("type" =: "text/javascript" <> "src" =: "https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.1/ace.js" <> "charset" =: "utf-8") blank
      el "style" $ text ".ace-wrapper > * { position: absolute; top:70vh; right:0px; left:0px; bottom: 0px; }"
    body = do
      text "Welcome to Obelisk!"
      el "p" $ text $ T.pack commonStuff
      elAttr "img" ("src" =: static @"obelisk.jpg") blank
      elAttr "div" ("class" =: "ace-wrapper") $ do
        ace <- aceWidgetStatic def (AceDynConfig Nothing) ""
        pure ()
      pure ()
