//
//  HikeView.swift
//  Landmarks
//
//  Created by 이조은 on 2023/05/10.
//

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack{
            HStack{
                HikeGraph(data: hike, path: \.elevation).frame(width: 50, height: 30)
                
                VStack(alignment: .leading){
                    Text(hike.name).font(.headline)
                    
                    Text(hike.distanceText)
                    }

                    Spacer()

                    Button {
                        showDetail.toggle()
                    } label: {
                        Label("Graph", systemImage: "chevron.right.circle")
                            .labelStyle(.iconOnly)
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
                            .padding()
                            .animation(.easeInOut, value: showDetail)
                }
            }
            if showDetail {
                HikeDetail(hike: hike)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView()
    }
}
