//
//  AnimeService.swift
//  Media-player
//
//  Created by Madiyar Bekmurat on 17.12.2025.
//

import Foundation
import Alamofire

final class AnimeService {
    func fetchTopAnime(limit: Int = 20, completion: @escaping (Result<[Anime], Error>) -> Void) {

        let url = "https://api.jikan.moe/v4/top/anime"
        let params: Parameters = ["limit": limit]

        AF.request(url, parameters: params)
            .validate()
            .responseDecodable(of: TopAnimeResponse.self) { response in
                switch response.result {
                case .success(let decoded):
                    completion(.success(decoded.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
