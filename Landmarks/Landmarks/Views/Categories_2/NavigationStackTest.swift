//
//  NavigationLink.swift
//  Landmarks
//
//  Created by 이조은 on 11/27/23.
//

import SwiftUI

struct NavigationStackTest: View {
    @State private var path: [Color] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button {
                    path.append(.yellow)
                } label: {
                    Text("나랑노랑")
                }
            }
            .navigationDestination(for: Color.self) { color in
                TestView(color: color)
                    .overlay {
                        VStack {
                            Button {
                                path.append([Color.red,Color.orange,Color.gray,Color.indigo].randomElement()!)
                            } label: {
                                Text("랜덤푸시")
                            }
                            Button {
                                path.removeAll()
                            } label: {
                                Text("초기화")
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    NavigationStackTest()
}
