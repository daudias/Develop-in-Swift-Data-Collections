import UIKit
import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
}

func fetchPhotoInfo(completition: @escaping (Result<PhotoInfo, Error>) -> Void) {
    let apiKey = "GFkCGo5I9dJS1HefrUXhXgqZNnpv3VZnZseadfI"
    var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
    urlComponents.queryItems = [
        "api_key": apiKey,
    ].map {
        URLQueryItem(name: $0.key, value: $0.value)
    }

    let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, request, error) in
        let jsonDecoder = JSONDecoder()
        if let data = data {
            do {
                let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
                completition(.success(photoInfo))
            } catch {
                completition(.failure(error))
            }
        }
    }
    task.resume()
}

fetchPhotoInfo { (result) in
    switch result {
    case .success(let photoInfo):
        print(photoInfo)
    case.failure(let error):
        print("Error: ", error)
    }
}
print("done")
