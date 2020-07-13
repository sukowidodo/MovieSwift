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
    @Published var movie2 = [Result]()
    @Published var detail:ResponseDetail? = nil
    
    private var api = RequestService()
    
    init() {
        getPopular()
        getTop()
    }
    
    func getPopular(){
        api.getPopular { (data, err) in
            DispatchQueue.main.async {
                self.movie = data?.results as! [Result]
                print(self.movie)
            }
        }
    }
    
    func getTop(){
        api.getTopRated { (data, err) in
            DispatchQueue.main.async {
                self.movie2 = data?.results as! [Result]
                //print(self.movie2)
            }
        }
    }
    
    func getDetail(_ id:String){
        api.getDetail(id) { (data, err) in
            DispatchQueue.main.async {
                self.detail = data
            }
        }
    }
}
