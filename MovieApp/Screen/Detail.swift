//
//  Detail.swift
//  MovieApp
//
//  Created by macbook on 7/10/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//

import SwiftUI

struct Detail: View {
    var id : String
    @ObservedObject var homeVM : HomeViewModel
    
    init(_ id:String) {
        self.id = id
        self.homeVM = HomeViewModel()
    }
    
    var body: some View {
        VStack {
            Text("")
        }.onAppear {
            self.homeVM.getDetail(self.id)
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail("1")
    }
}
