import Foundation

protocol APIProxy {
    
    /// A method for performing an network request.
    ///
    /// - Parameters:
    ///   - router: A route for where the call should go, conforming to APIRouter protocol
    ///   - completion: A closure with a response conforming to APIResponse protocol
    /// - Returns: A response conforming to APIRequest and Cancable protocol
    func request(router: APIRouter, completion: @escaping (_ response: APIResponse) -> ()) -> APIRequest
    
    
    /// A method for performing an network request with authorization
    ///
    /// - Parameters:
    ///   - authorization: A object conforming to APIAuthorization protocol
    ///   - router: A route for where the call should go, conforming to APIRouter protocol
    ///   - completion: A closure with a response conforming to APIResponse protocol
    /// - Returns: A response conforming to APIRequest and Cancable protocol
    func request(usingAuthorization authorization:APIAuthorization, andRoute router:APIRouter, completion: @escaping (_ response: APIResponse) -> ()) -> APIRequest
}
