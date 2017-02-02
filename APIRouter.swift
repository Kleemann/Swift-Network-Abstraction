import Foundation

typealias APIParams = [String : Any]
typealias APIHeaders = [String : String]

enum HttpMethod {
    case post, get, delete, put
}

enum Encoding {
    case url, json
}

protocol APIRouter {
    var method: HttpMethod { get }
    var encoding: Encoding? { get }
    var path: String { get }
    var parameters: APIParams { get }
    var headers: APIHeaders? { get }
    var baseUrl: String { get }
}
