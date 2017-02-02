import Foundation
import Alamofire

/// Implementation of APIProxy specific to Alamofire
class AlamofireProxyImplementation: APIProxy {

    
    func request(router: APIRouter, completion: @escaping (_ response: APIResponse) -> ()) -> APIRequest {
        
        let url = "\(router.baseUrl)\(router.path)"
        let request = Alamofire.request(url,
                                        method: mapHttpMethod(method: router.method),
                                        parameters: router.parameters,
                                        encoding: mapEncoding(encoding: router.encoding),
                                        headers: router.headers)
            .responseJSON { (response) in
                
                let wrappedResponse = APIResponse(response: response)
                completion(wrappedResponse)
        }
        
        return APIRequest(request: request)
    
    }
    
    func request(usingAuthorization authorization:APIAuthorization, andRoute router:APIRouter, completion: @escaping (_ response: APIResponse) -> ()) -> APIRequest {
        var headers: HTTPHeaders = router.headers ?? [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: authorization.client_id, password: authorization.client_secret) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        let url = "\(router.baseUrl)\(router.path)"
        let request = Alamofire.request(url,
                                        method: mapHttpMethod(method: router.method),
                                        parameters: router.parameters,
                                        encoding: mapEncoding(encoding: router.encoding),
                                        headers: headers)
            .responseJSON { (response) in
                
                let wrappedResponse = APIResponse(response: response)
                completion(wrappedResponse)
        }
        return APIRequest(request: request)
    }
    
    //Map the httpMethod to Alamofires httpMethod
    fileprivate func mapHttpMethod(method:HttpMethod) -> Alamofire.HTTPMethod {
        switch method {
        case .get:      return HTTPMethod.get
        case .post:     return HTTPMethod.post
        case .delete:   return HTTPMethod.delete
        case .put:      return HTTPMethod.put
        }
    }
    
    //Map the encoding to alamofires parameter endcoding
    fileprivate func mapEncoding(encoding:Encoding?) -> Alamofire.ParameterEncoding {
        switch encoding {
        case .some(.json):
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
}

// Alamofire DataRequest already has cancel method, but it needs to conform to our cancelable protocol.
extension DataRequest: Cancelable {}

