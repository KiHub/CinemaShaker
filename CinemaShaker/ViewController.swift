//
//  ViewController.swift
//  CinemaShaker
//
//  Created by  Mr.Ki on 03.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let key = "1f81e8e1"
    let startNumber = 0000000
    let finishNumber = 4513678
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchMovie()
    }


}


extension ViewController {
    
    func fetchMovie() {
        print(Int.random(in: startNumber..<finishNumber ))
        let randomMovieId = Int.random(in: startNumber...finishNumber )
        print(randomMovieId)
        
   //     let url = URL(string: "http://www.omdbapi.com/?i=tt\(randomMovieId)&apikey=\(key)") else { return }
        
        let urlString = "https://www.omdbapi.com/?i=tt3642016&apikey=\(key)"
        print(urlString)
        
        if let url = URL(string: urlString) {
            
        //    let session = URLSession(configuration: .default)
           // let task = session.dataTask(with: url) { (data, response, error) in
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if error != nil {
                  //  self.delegate?.didFailWithError(error: error!)
                    print("Error")
                    return
                }
                
//                if let response = response {
//                    print(response)
//                }
                
                if let data = data {
                    if let randomMovie = self.parseJSON(data) {
                        print(randomMovie.actors)
                      //  self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
            task.resume()
        }
        
        
        
        
    }
    
    func parseJSON(_ data: Data) -> Movie? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Movie.self, from: data)
            let movieData = decodedData
            print(movieData)
            return movieData
            
        } catch {
          //  delegate?.didFailWithError(error: error)
            
            return nil
        }
    }
    
}
