//
//  Home.swift
//  MovieApp
//
//  Created by macbook on 7/10/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//

import SwiftUI

struct Home: View {
    @ObservedObject var homeVM : HomeViewModel
    
    init(){
        self.homeVM = HomeViewModel()
    }
    
    var body: some View {
        VStack{
            Text("Top Rated")
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(self.homeVM.movie){ items in
                        WebImage(imageURL: URL(string: "https://via.placeholder.com/300"))
                    }
                }.onAppear {
                    self.homeVM.getPopular()
                }
            }
            
            Text("Popular")
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    ForEach(self.homeVM.movie){ items in
                        WebImage(imageURL: URL(string: "https://via.placeholder.com/300"))
                    }
                }.onAppear {
                    self.homeVM.getPopular()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
