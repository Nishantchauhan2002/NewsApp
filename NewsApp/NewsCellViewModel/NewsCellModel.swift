
import Foundation

// MARK: - Welcome
struct NewsCellModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [News]?
    
    enum CodingKeys: String, CodingKey {
            case status = "status"
            case totalResults = "totalResults"
            case articles = "articles"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
            articles = try values.decodeIfPresent([News].self, forKey: .articles)
        }
}

// MARK: - Article
struct News: Codable {
    let source: Source?
    var author: String?
    var title: String?
    var description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
            case source = "source"
            case author = "author"
            case title = "title"
            case description = "description"
            case url = "url"
            case urlToImage = "urlToImage"
            case publishedAt = "publishedAt"
            case content = "content"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            source = try values.decodeIfPresent(Source.self, forKey: .source)
           
            author = try values.decodeIfPresent(String.self, forKey: .author)
            if (self.author == nil ) {
                  self.author = "Damon Salvatore "
            }
            title = try values.decodeIfPresent(String.self, forKey: .title)
            if (self.title == "[Removed]"){
                self.title = "Gold and Bitcoin Peaks: Are We Heading to Another Dot-Com Bubble?"
            }
            description = try values.decodeIfPresent(String.self, forKey: .description)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
            publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
            content = try values.decodeIfPresent(String.self, forKey: .content)
        }
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        if (self.id == nil ) {
              self.id = "000"
        }
        name = try values.decodeIfPresent(String.self, forKey: .name)
        
    }
}
