//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by macbook on 7/10/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    @Published var movie = [Result]()
    private var api = RequestService()
    
    func getPopular(){
        api.getPopular { (data, err) in
            DispatchQueue.main.async {
                self.movie = data?.results as! [Result]
            }
        }
    }
    
    func getTop(){
        api.getTopRated { (data, err) in
            
        }
    }
}
