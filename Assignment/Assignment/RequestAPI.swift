//
//  RequestAPI.swift
//  Assignment
//
//  Created by 이조은 on 12/26/23.
//

import Foundation

class RequestAPI: ObservableObject {
    @Published var ArticleData = [Article]()

    init() {
        guard let url = URL(string: "https://api.realworld.io/api/articles?limit=1") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }

            do {
                let result = try JSONDecoder().decode(ArticleDTO.self, from: data)
                DispatchQueue.main.async { [self] in
                    self.ArticleData = result.articles
                    // print("ArticleData: \(ArticleData)")
                }
            } catch {
                print("\(error.localizedDescription)\n\(error)")
            }
        }.resume()
    }
}
