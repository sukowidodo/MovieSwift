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
                NavigationView {
                    HStack(spacing: 20) {
                        ForEach(self.homeVM.movie){ items in
                            NavigationLink(destination: Detail("\(items.id)")) {
                                WebImage(imageURL: URL(string: "\(Constants.BASE_IMAGE_PATH) \(items.posterPath)"))
                            }
                        }
                    }.onAppear {
                        self.homeVM.getTop()
                    }
                }
            }
            
            Text("Popular")
            ScrollView(.vertical) {
                NavigationView {
                    VStack(spacing: 20) {
                        ForEach(self.homeVM.movie){ items in
                            NavigationLink(destination: Detail("\(items.id)")) {
                                WebImage(imageURL: URL(string: "\(Constants.BASE_IMAGE_PATH) \(items.posterPath)"))
                            }
                        }
                    }.onAppear {
                        self.homeVM.getPopular()
                    }
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
