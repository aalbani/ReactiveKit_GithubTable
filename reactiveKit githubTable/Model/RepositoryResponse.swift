import ObjectMapper



class RepositoryResponse: Mappable {
    
    var resultsCount: Int?
    var repositories: [Repository]?
    
    
    required init?(map: Map) {}
    
     func mapping(map: Map) {
        resultsCount <- map["total_count"]
        repositories <- map["items"]
    }
}
