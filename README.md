# Swift Network Abstraction
Simple network abstraction written in Swift 3.

## Usage
See [`/Example`](https://github.com/Kleemann/Swift-Network-Abstraction/tree/master/Example)  folder for implementation usage of Proxy, Router and Response initialization.

After implementing you favorite network framework you can create a NetworkManager as simple as:
```swift
let networkManager: APIManager =  NetworkManager(withProxy: AlamofireProxyImplementation())
```
For testing a stub of APIProxy can be implemented like: [`ErrorProxyStub.swift`](https://github.com/Kleemann/Swift-Network-Abstraction/blob/master/Example/ErrorProxyStub.swift) and swapped out for the live network proxy like so:

```swift
let networkManager: APIManager =  NetworkManager(withProxy: NetworkManager(withProxy: ErrorProxyStub(withError: NetworkError.server, andStatusCode: 500))
```

Or even use a IoC container like: [Swift IoC Container](https://github.com/Kleemann/Swift-IoC-Container)
