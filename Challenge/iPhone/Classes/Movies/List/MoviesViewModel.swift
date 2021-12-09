//
//  MoviesViewModel.swift
//  Challenge
//
//  Created by Antonella Brini Vago on 04/12/2021.
//

import Foundation

struct MoviesViewModel {
    
    var bindInitRequest = { () -> Void in }
    var bindEndRequest = { () -> Void in }
    var bindMovies = { (_ arrayMovies: [Movie]) -> Void in }
    var bindError = { (_ errorMessage: String) -> Void in }
    
    private let model = MovieWS()
    
    func getAllMovies() {
        
        self.bindInitRequest()
        
        self.model.getAllMovies { arrayMoviesDTO in
            

            if arrayMoviesDTO.isEmpty {
                self.bindError("No se encontraron resultado")
                self.bindMovies([])
            } else{
                self.bindMovies(arrayMoviesDTO.toMovies)
            }
            
            self.bindEndRequest()
        }
    }
    
}
