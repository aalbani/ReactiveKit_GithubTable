import Alamofire
import AlamofireObjectMapper

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/search/repositories"
    private init() {}
    
    func fetch(parameters: Parameters?, httpHeader: HTTPHeaders?, complationHandler: @escaping (Any?) -> Void ) {
        Alamofire.request(baseUrl, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .responseObject { (response: DataResponse<RepositoryResponse>) in
            
                if response.result.isFailure {
                    print(response.result.error!)
                } else {
                    let repoResponse = response.result.value
                    complationHandler(repoResponse)
                }
            
        }
        
    }
}
