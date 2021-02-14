import Foundation

var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!

urlComponents.queryItems = [
    "term": "jack+johnson"
].map { URLQueryItem(name: $0.key, value: $0.value)}

let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
    if let data = data, let string = String(data: data, encoding: .utf8) {
        print(string)
    }
}

task.resume()
