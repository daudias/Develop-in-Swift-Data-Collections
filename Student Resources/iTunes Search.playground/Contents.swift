import Foundation
import UIKit

struct StoreItem: Codable {
    var trackName: String
    var artistName: String
    var kind: String
    var description: String
    var url: URL

    enum CodingKeys: String, CodingKey {
        case trackName
        case artistName
        case kind
        case description
        case url = "trackViewUrl"
    }
    
    enum AdditionalKeys: String, CodingKey {
        case description = "longDescription"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        trackName = try values.decode(String.self, forKey: .trackName)
        artistName = try values.decode(String.self, forKey: .artistName)
        kind = try values.decode(String.self, forKey: .kind)
        url = try values.decode(URL.self, forKey: .url)
        
        if let description = try? values.decode(String.self, forKey: .description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: .description)) ?? ""
        }
    }
}

struct SearchResponse: Codable {
    var results: [StoreItem]
}


extension Data {
    func prettyPrintedString() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: jsonData, encoding: .utf8)
        else {
            print("Failed to read JSON Object.")
            return
        }
        print(prettyPrintedString)
    }
}

func fetchItems(matching query: [String: String], completion: @escaping (Result<[StoreItem], Error>) -> Void) {
    var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!
    urlComponents.queryItems = query.map {
        URLQueryItem(name: $0.key, value: $0.value)
    }
    let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            do {
                let jsonDecoder = JSONDecoder()
                let searchResponse = try jsonDecoder.decode(SearchResponse.self, from: data)
                completion(.success(searchResponse.results))
            } catch {
                completion(.failure(error))
            }
        }
    }
    task.resume()
}

let query = [
    "term": "justin+bieber"
]

fetchItems(matching: query, completion: { result in
    switch result {
    case .success(let storeItems):
        print(storeItems.first!)
    case .failure(let error):
        print(error)
    }
})
