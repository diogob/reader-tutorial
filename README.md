# ReaderT Tutorial

## Quickstart

Ensure that you have installed stack:
```
curl -sSL https://get.haskellstack.org/ | sh
```

In the project root run:
```
stack --install-ghc test
```

The above command will install the appropriate compiler and build the project libraries and test suite.

## Using a ReaderT

Using functions from the module `CoinberryApi` and the `App` type provided by `Polymorphic` build a program that will fetch the prices for **BTC** and **ETH** and display then like this:

``` 
You can buy BTC for ...
You can buy ETH for ... 
```

The program should use all effectful computations from the `Context`, never importing directly functions that run in `IO`.

## Creating tests

In the test suite we want to mock all effectful computaions from `IO`.
Namely the HTTP GET requests and the calls to print to the console.
In order to achieve this model the necessary functions as part of the `Context` in the `App` type and supply the mock functions when running the tests.