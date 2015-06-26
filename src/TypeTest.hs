{-# LANGUAGE ScopedTypeVariables #-}

module TypeTest where

import Control.Exception (evaluate, try, ErrorCall)
import Test.Hspec.Expectations (Expectation, expectationFailure)

shouldNotCompile :: forall a. a -> Expectation
shouldNotCompile a = do
  result <- try (evaluate a) :: IO (Either ErrorCall a)
  case result of
    Right _ -> expectationFailure "Expected expression to not compile but it did compile"
    Left _ -> return ()
