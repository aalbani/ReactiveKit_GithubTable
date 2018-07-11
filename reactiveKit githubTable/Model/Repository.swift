
import ObjectMapper

class Repository : Mappable {

    var repoName: String?
    var ownerName: String?
    var repoDiscription: String?
    var repoStarts: Int?
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        repoName <- map["name"]
        ownerName <- map["owner.login"]
        repoDiscription <- map["description"]
        repoStarts <- map["stargazers_count"]
    }
    
}
