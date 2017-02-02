import Foundation

struct APIResponse {
    
    var statusCode: Int = 200
    var error: Error?
    var responseData: Any?
    
    
    init(statusCode: Int = 200, error: Error? = nil, responseData: Any? = nil ) {
        self.statusCode = statusCode
        self.error = error
        self.responseData = responseData
    }
}
