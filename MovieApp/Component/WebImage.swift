//
//  WebImage.swift
//  MovieApp
//
//  Created by macbook on 7/10/20.
//  Copyright © 2020 SmartCyberSolution. All rights reserved.
//
import Combine
import SwiftUI

struct WebImage: View {

    @ObservedObject private var imageLoader: DataLoader

    public init(imageURL: URL?) {
        imageLoader = DataLoader(resourseURL: imageURL)
    }

    public var body: some View {
        if let uiImage = UIImage(data: self.imageLoader.data) {
            return AnyView(Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: ContentMode.fill))
        } else {
            return AnyView(Image(systemName: "ellipsis")
                            .onAppear(perform: { self.imageLoader.loadImage() }))
        }
    }
}
