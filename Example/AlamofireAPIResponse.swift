import Foundation
import Alamofire

// Add an convenience initializer for Alamofire's Response object type
extension APIResponse {
  /// Convenience initializer for use with Alamofire Response objects
  ///
  /// - Parameter response: Alamofire DataResponse object to map to APIResponse object
  init(response: DataResponse<Any>) {

    
    if let value = response.result.value {
      self.responseData = value
    }

    // Check if an error occurred
    if let code = response.response?.statusCode {
        statusCode = code
    }
    
    if let error = response.result.error {
        self.error = error
    }
  }
}
