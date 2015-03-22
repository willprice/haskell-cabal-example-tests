module Main where

import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck as SC

import Examples

main = defaultMain tests

tests :: TestTree
tests = testGroup "Testing Examples" [properties, unitTests]

properties = testGroup "Properties (tested via SmallCheck)"
    [ SC.testProperty "Test one implementation against another" $
        \list -> length' (list :: [Int]) == length list
    ]

unitTests = testGroup "Tests (run via HUnit)"
    [ testCase "compare'" $
        [1, 2, 3] `compare'` [1, 2] @?= GT
    , testCase "length'" $
        length' [1, 2, 3] @?= 3
    ]
