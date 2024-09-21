//
//  TestView.swift
//  Landmarks
//
//  Created by 이조은 on 11/27/23.
//

import SwiftUI

public struct TestView: View {
    @State var color: Color

    public init(color: Color? = nil
    ) {
        self.color =  color ?? Color(.systemGray)
    }

    public var body: some View {
        ZStack {
            color.ignoresSafeArea()
        }
    }
}

#Preview {
    TestView()
}
