//
//  URLImageModel.swift
//  Assignment
//
//  Created by 이조은 on 12/26/23.
//
import SwiftUI
import Combine

class URLImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageSubscription: AnyCancellable?

    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }

    func loadImage() {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }

        imageSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.image = $0
            }
    }

    func cancel() {
        imageSubscription?.cancel()
    }
}

