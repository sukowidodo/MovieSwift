//
//  Home.swift
//  MovieApp
//
//  Created by macbook on 7/10/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//

import SwiftUI
import URLImage

struct Home: View {
    @EnvironmentObject var homeVM : HomeViewModel
    
    var body: some View {
        ZStack {
        List {
            //first row
            VStack(alignment: .leading, spacing: 10){
                Text("Top Rated").font(.title).padding(.leading)
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            ForEach(self.homeVM.movie2){ items in
                                URLImage(URL(string: "\(Constants.BASE_IMAGE_PATH)\(items.posterPath)")!){ proxy in
                                        proxy.image
                                    }.frame(width: geometry.size.width / 2, height: 230).padding().cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.orange, lineWidth: 4))
                                    .shadow(radius: 30)
                            }
                        }
                    }
                }
            }.frame(height: 320)
            .listRowInsets(EdgeInsets())
            
            //second row
            VStack(alignment: .leading, spacing: 10){
                Text("POPULAR").font(.title).padding(.leading)
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 10) {
                            ForEach(self.homeVM.movie){ items in
                                URLImage(URL(string: "\(Constants.BASE_IMAGE_PATH)\(items.posterPath)")!){ proxy in
                                        proxy.image
                                }.frame(width: geometry.size.width / 2, height: 230).padding().cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.orange, lineWidth: 4))
                                .shadow(radius: 30)
                            }
                        }
                    }
                }
            }.frame(height: 320)
            .listRowInsets(EdgeInsets())
        }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
