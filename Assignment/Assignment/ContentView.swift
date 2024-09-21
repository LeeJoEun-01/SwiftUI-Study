//
//  ContentView.swift
//  Assignment
//
//  Created by 이조은 on 12/23/23.
//

import SwiftUI
import YDS_SwiftUI
import TipKit


struct ContentView: View {
    @ObservedObject var requestAPI = RequestAPI()

    private let favoriteTip = FavoriteTip()
    @State var isFollwing: Bool = false

    var body: some View {
        ScrollView(.vertical) {
            VStack (alignment: .center) {
                ForEach(requestAPI.ArticleData, id: \.self) { result in
                    HStack (){
                        Text(result.title).font(.title3)
                        Spacer()
                    }.padding(.bottom, 6)
                    //.background(.pink)

                    HStack (alignment: .center, spacing: 10){
                        ForEach(result.tagList, id: \.self) { tag in
                            YDSBadge(
                                text: tag,
                                icon: YDSIcon.clipLine, color: YDSColor.emeraldItemBG
                            )
                        }
                        Spacer()
                    }.padding(.bottom, 10)
                    //.background(.gray)

                    Text(result.body).font(.body)
                    // .background(.indigo)

                    HStack{
                        YDSProfileImageView(image: Image("apple"), size: .small)
                        Spacer()
                        Button(action: {
                            self.isFollwing.toggle()
                        }) {
                            self.isFollwing ? YDSIcon.starFilled : YDSIcon.starLine
                        }// .popoverTip(favoriteTip, arrowEdge: .top)
                    }.overlay(GeometryReader { geometry in
                        Text(result.author.username)
                            .frame(width: geometry.size.width, height:  geometry.size.height, alignment: .center)
                    })
                    TipView(favoriteTip, arrowEdge: .top)
                }.padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    ContentView()
}
