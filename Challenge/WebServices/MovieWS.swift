//
//  MovieWS.swift
//  Challenge
//
//  Created by Antonella Brini Vago on 03/12/2021.
//

import Foundation
import Alamofire

typealias MoviesHandler = (_ arrayMoviesDTO: [MovieDTO]) -> Void

struct MovieWS {
    
    func getAllMovies(completionHandler: @escaping MoviesHandler) {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=2cd5997cf90122d0ca9edc27d779304b"
        let request = AF.request(urlString, method: .get)
        
        request.response { DataResponse in
 
                guard let data = DataResponse.data else{return}
                
                let jsondecoder = JSONDecoder()
                let pageMovies = try? jsondecoder.decode(PageMovieDTO.self, from: data)
                
                completionHandler(pageMovies?.results ?? [])

        }
    }
}
