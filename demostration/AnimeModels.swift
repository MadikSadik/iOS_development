//
//  Anime.swift
//  Media-player
//
//  Created by Madiyar Bekmurat on 17.12.2025.
//

import Foundation

struct TopAnimeResponse: Codable{
    let data: [Anime]
}

struct Anime: Codable{
    let malId: Int
    let title: String
    let images: AnimeImages
    let score: Double?
    let synopsis: String?
    
    enum CodingKeys: String, CodingKey {
        case malId = "mal_id"
        case title, images, score, synopsis
    }
}

struct AnimeImages: Codable{
    let jpg: AnimeJpg
}

struct AnimeJpg: Codable{
    let imageUrl: String
    let largeImageUrl: String?
    
    enum CodingKeys: String, CodingKey{
        case imageUrl = "image_url"
        case largeImageUrl = "large_image_url"
    }
}




/* JSON shiii
 {
 "data": {
   "mal_id": 0,
   "url": "string",
   "images": {
     "jpg": {
       "image_url": "string",
       "small_image_url": "string",
       "large_image_url": "string"
     },
     "webp": {
       "image_url": "string",
       "small_image_url": "string",
       "large_image_url": "string"
     }
   },
   "trailer": {
     "youtube_id": "string",
     "url": "string",
     "embed_url": "string"
   },
   "approved": true,
   "titles": [
     {
       "type": "string",
       "title": "string"
     }
   ],
   "title": "string",
   "title_english": "string",
   "title_japanese": "string",
   "title_synonyms": [
     "string"
   ],
   "type": "TV",
   "source": "string",
   "episodes": 0,
   "status": "Finished Airing",
   "airing": true,
   "aired": {
     "from": "string",
     "to": "string",
     "prop": {
       "from": {
         "day": 0,
         "month": 0,
         "year": 0
       },
       "to": {
         "day": 0,
         "month": 0,
         "year": 0
       },
       "string": "string"
     }
   },
   "duration": "string",
   "rating": "G - All Ages",
   "score": 0.1,
   "scored_by": 0,
   "rank": 0,
   "popularity": 0,
   "members": 0,
   "favorites": 0,
   "synopsis": "string",
   "background": "string",
   "season": "summer",
   "year": 0,
   "broadcast": {
     "day": "string",
     "time": "string",
     "timezone": "string",
     "string": "string"
   },
   "producers": [
     {
       "mal_id": 0,
       "type": "string",
       "name": "string",
       "url": "string"
     }
   ],
   "licensors": [
     {
       "mal_id": 0,
       "type": "string",
       "name": "string",
       "url": "string"
     }
   ],
   "studios": [
     {
       "mal_id": 0,
       "type": "string",
       "name": "string",
       "url": "string"
     }
   ],
   "genres": [
     {
       "mal_id": 0,
       "type": "string",
       "name": "string",
       "url": "string"
     }
   ],
   "explicit_genres": [
     {
       "mal_id": 0,
       "type": "string",
       "name": "string",
       "url": "string"
     }
   ],
   "themes": [
     {
       "mal_id": 0,
       "type": "string",
       "name": "string",
       "url": "string"
     }
   ],
   "demographics": [
     {
       "mal_id": 0,
       "type": "string",
       "name": "string",
       "url": "string"
     }
   ]
 }
}
 */
