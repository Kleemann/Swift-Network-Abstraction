import Foundation

class ErrorProxyStub: APIProxy {
    
    fileprivate let error:Error
    fileprivate let statusCode:Int
    
    init(withError error:Error, andStatusCode statusCode:Int) {
        self.error = error
        self.statusCode = statusCode
    }
    
    func request(router: APIRouter, completion: @escaping (_ response: APIResponse) -> ()) -> APIRequest {
        let apiResponse = APIResponse(statusCode: statusCode, error: error, responseData: nil)
        completion(apiResponse)
        return APIRequest(request: APIRequestDummy())
        
    }
    
    func request(usingAuthorization authorization:APIAuthorization, andRoute router:APIRouter, completion: @escaping (_ response: APIResponse) -> ()) -> APIRequest {
        let apiResponse = APIResponse(statusCode: statusCode, error: error, responseData: nil)
        completion(apiResponse)
        return APIRequest(request: APIRequestDummy())
    }

}
