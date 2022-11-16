//
//  Network.swift
//  HackerNews
//
//  Created by Stefan Bayne on 11/16/22.
//

import Foundation
/*
 Observable object is how we past results from list to Views
 */
class NetworkManger: ObservableObject {
    
    /*
     We use publish to publish post to views.
     We need the post array to act as the array in the views. That's how we receive the data.
     We can hear when the contents change every time with @Published.
     */
    @Published var posts = [Post]()
    
    func fetchData() {
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {// url
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil { // if no errors, continue
                    
                    let decoder = JSONDecoder() // decode data backed from json
                    
                    if let safeData = data { // necessary for optional results data

                        do { // try-catch to catch any errors
                            let results = try decoder.decode(Results.self, from: safeData) // store results in variable
                            
                            DispatchQueue.main.async { // must do this when we fetch the data
                                self.posts = results.hits // sets posts to the results object
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume() // starts networking tasks.
        }
    }
}
