//
//  JSONMovie.swift
//  Watched
//
//  Created by Ali on 03.12.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import Foundation

struct Show {
    var title: String
    var genres: String
    var releaseDate: String
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json: [String: Any]) throws {
        guard let title = json["title"] as? String else {
            throw SerializationError.missing("title is missing")
        }
        guard let genres = json["genres"] as? String else {
            throw SerializationError.missing("genres is missing")
        }
        guard let releaseDate = json["releaseDate"] as? String else {
            throw SerializationError.missing("releaseDate is missing")
        }
        
        self.title = title
        self.genres = genres
        self.releaseDate = releaseDate
        
    }
    
    static let basePath = "https://api.themoviedb.org/3/movie/76341?api_key=af86bc337bd12d1276a8e815b9c45557"
}
