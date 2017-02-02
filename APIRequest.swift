import Foundation

protocol Cancelable {
    func cancel()
}

struct APIAuthorization {
    let client_id:String
    let client_secret:String
}


struct APIRequest {
    
    let request: Cancelable
    
    init(request: Cancelable) {
        self.request = request
    }
    
    /// Cancel the network request
    func cancel() {
        request.cancel()
    }
}
