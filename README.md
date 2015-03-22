# Quickcheck example

A minimal project showing how to integrate quickcheck with cabal and tasty, the
test runner framework.

## Run
```bash
$ cabal sandbox init
$ cabal test                # Run the tests
$ cabal run                 # Run the (incredibly boring executable)
```

We demonstrate that smallcheck fails with its default settings on a pathological
example, and how that can be amended by changing the depth to which it tests at

```bash
$ cabal test
    Building quickcheck-example-0.1.0.0...
    Preprocessing library quickcheck-example-0.1.0.0...
    In-place registering quickcheck-example-0.1.0.0...
    Preprocessing executable 'quickcheck-example' for
    quickcheck-example-0.1.0.0...
    Preprocessing test suite 'tests' for quickcheck-example-0.1.0.0...
    Running 1 test suites...
    Test suite tests: RUNNING...
    Test suite tests: PASS
    Test suite logged to: dist/test/quickcheck-example-0.1.0.0-tests.log
    1 of 1 test suites (1 of 1 test cases) passed.

$ cabal test --test-options="--smallcheck-depth 10000"
    Building quickcheck-example-0.1.0.0...
    Preprocessing library quickcheck-example-0.1.0.0...
    In-place registering quickcheck-example-0.1.0.0...
    Preprocessing executable 'quickcheck-example' for
    quickcheck-example-0.1.0.0...
    Preprocessing test suite 'tests' for quickcheck-example-0.1.0.0...
    Running 1 test suites...
    Test suite tests: RUNNING...
    Testing Examples
      Properties (tested via SmallCheck)
        Test one implementation against another: FAIL
          there exists [0,0,0,0,0] such that
            condition is false
      Tests (run via HUnit)
        compare':                                OK
        length':                                 OK

    1 out of 3 tests failed (0.00s)
    Test suite tests: FAIL
    Test suite logged to: dist/test/quickcheck-example-0.1.0.0-tests.log
    0 of 1 test suites (0 of 1 test cases) passed.

```

## References
- [Tasty](http://documentup.com/feuerbach/tasty)
- [SmallCheck](http://www.cs.york.ac.uk/fp/smallcheck/)
- [SmallCheck paper](http://www.cs.york.ac.uk/fp/smallcheck/smallcheck.pdf)
- [HUnit docs](https://hackage.haskell.org/package/tasty-hunit-0.9.2/docs/Test-Tasty-HUnit.html)
- [Holy Haskell Project Starter](http://yannesposito.com/Scratch/en/blog/Holy-Haskell-Starter/)
