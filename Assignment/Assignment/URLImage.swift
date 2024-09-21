//
//  URLImage.swift
//  Assignment
//
//  Created by 이조은 on 12/26/23.
//
import SwiftUI

struct URLImage: View {
    @ObservedObject var urlImageModel: URLImageModel

    init(urlString: String?) {
        urlImageModel = URLImageModel(urlString: urlString)
    }

    var body: some View {
        Image(uiImage: urlImageModel.image ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
