//
//  CustomProgressView.swift
//  TransactionFetcherTwo
//
//  Created by oren shalev on 23/04/2022.
//

import SwiftUI

struct CustomProgressView: View {
    var color: Color
    var scale: CGFloat
    var bgColor: Color
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: color))
                .scaleEffect(scale, anchor: .center)
        }
        
    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(color: .green, scale: 2, bgColor: .red)
    }
}
