//
//  MovieTableViewCell.swift
//  Challenge
//
//  Created by Antonella Brini Vago on 03/12/2021.
//

import UIKit
import Alamofire

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var lblName: UILabel!
//    @IBOutlet weak private var lblReleaseDate: UILabel!
    @IBOutlet weak private var imgMovie: UIImageView!
    
//    @IBOutlet var arrayStars: [UIImageView]!
    
    
    func updateData(_ movie: Movie) {
        
        self.animateAppear()
        
        self.lblName.text = movie.name
//        self.lblReleaseDate.text = movie.releaseDateFormat
   
//        for (index, imagStar) in self.arrayStars.enumerated() {
//            imagStar.isHidden = !(index < movie.voteAverage)
//        }
        
        let request = AF.request(movie.urlImageBackdrop)
        request.response { dataResponse in
            guard let data = dataResponse.data else {return}
            let image = UIImage(data: data)
            self.imgMovie.image = image
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func animateAppear() {
        
        self.alpha = 0
        self.transform = CGAffineTransform(translationX: -100, y: 0)
        
        let randomDelay = CGFloat.random(in: 0...(0.8))
        
        UIView.animate(withDuration: 0.6, delay: randomDelay, options: [.curveEaseInOut], animations: {
            self.alpha = 1
            self.transform = .identity
        }, completion: nil)
    }
    
}


extension MovieTableViewCell {
     
    class func buildInTableView(_ tableView: UITableView, indexPath: IndexPath, movie: Movie) -> MovieTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        cell?.updateData(movie)
        return cell ?? MovieTableViewCell()
    }
    
}
