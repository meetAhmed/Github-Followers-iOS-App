//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Ahmed Ali on 27/06/2024.
//

import Foundation

protocol NetworkManager: AnyObject {
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) -> Void
}

class NetworkManagerImpl: NetworkManager {
    private let baseUrl = "https://api.github.com/users/"
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + username + "/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            return completed(.failure(.invalidUrl))
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                return completed(.failure(.networkError))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completed(.failure(.invalidResponse))
            }
            guard let data else {
                return completed(.failure(.invalidData))
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                return completed(.success(followers))
            } catch {
                return completed(.failure(.failedToParseData))
            }
        }
        task.resume()
    }
}
