//
//  Movie.swift
//  Challenge
//
//  Created by Antonella Brini Vago on 03/12/2021.
//

import Foundation

struct Movie {
    
    let id: Int
    let name: String
    let overview: String
    private let posterPath: String
    private let backdropPath: String
    private let releaseDate: Date?
    let voteAverage: Int
    
    var urlImage: String {
        "https://image.tmdb.org/t/p/w500" + self.posterPath
    }
    
    var urlImageBackdrop: String {
        "https://image.tmdb.org/t/p/w500" + self.backdropPath
    }
    
    var releaseDateFormat: String {
        self.releaseDate?.toStringWithFormat("EEEE dd 'de' MMMM 'del' yyyy") ?? "Próximamente"
    }
    
    init(_ dto: MovieDTO) {
        self.id = dto.id ?? 0
        self.name = dto.title ?? "--"
        self.overview = dto.overview ?? "Descripción no disponible"
        self.posterPath = dto.poster_path ?? ""
        self.backdropPath = dto.backdrop_path ?? ""
        self.voteAverage = Int(dto.vote_average ?? 0)
        self.releaseDate = dto.release_date?.toDateWithFormat("yyyy-MM-dd")
    }
}


