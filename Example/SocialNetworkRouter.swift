import Foundation
import Alamofire

enum SocialNetworkEndpoint {
    case posts
    case comment(postId:Int, comment:String)
}

struct SocialNetworkRouter: APIRouter {
    let endpoint: SocialNetworkEndpoint
    
    init(endpoint: SocialNetworkEndpoint) {
        self.endpoint = endpoint
    }
    
    var method: HttpMethod {
        switch endpoint {
        case .posts:
            return .get
        case .comment:
            return .post
        }
    }
    
    var path: String {
        switch endpoint {
        case .posts:
            return "/posts"
        case .comment:
            return "/comment"
        }
        
    }
    
    var parameters: APIParams {
        switch endpoint {
        case .posts:
            return APIParams()
        case .comment(let postId, let comment):
            return ["postId": postId, "comment" : comment]
        }
    }
    
    var headers: APIHeaders? = nil
    
    var encoding: Encoding? {
        switch endpoint {
        case .posts:
            return .json
        case .comment:
            return .json
        }
    }
    
    var baseUrl: String {
        switch endpoint {
        case .posts:
            return "https://socialnetwork.com/api/v1"
        case .comment:
            return "https://socialnetwork.com/api/v2"
        }
    }
}
