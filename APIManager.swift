import Foundation



protocol APIManager {
    var proxy: APIProxy { get }
}

//A class implementation that takes an APIProxy type in init.
class NetworkManager:APIManager {
    var proxy: APIProxy
    init(withProxy proxy:APIProxy) {
        self.proxy = proxy
    }
}
