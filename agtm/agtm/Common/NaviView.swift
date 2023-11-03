//
//  NaviView.swift
//  agtm
//
//  Created by yujin on 2023/10/05.
//

import SwiftUI

struct NaviView: View {
    var leftButton: [String]
    var title: String?
    var rightButton: String?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack(spacing: (UIScreen.main.bounds.width - 230) / 2) {
            // left button
            HStack {
                ForEach(leftButton, id:\.self) { button in
                    Button {
                        //action
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(button)
                            .frame(width: 24)
                            
                    }
                    .padding(.trailing, (leftButton.count < 2) ? 30 : 0)
                }
            }
            .frame(width: 58)
            
            Text(title ?? "")
                .frame(alignment: .center)
                .foregroundColor(.white)
                .frame(width: 100)
            
            // right button
            Button {
                //action
            } label: {
                Image(rightButton ?? "")
                    .padding(.trailing, 20)
            }
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 44)
        .background(Color.gray800)
        .padding(.top, 40)
    }
}

struct NaviView_Previews: PreviewProvider {
    static var previews: some View {
        NaviView(leftButton: [])
        NaviView(leftButton: ["back_arrow", "back_home"], title: "상세", rightButton: "search")
        NaviView(leftButton: ["back_arrow", "back_home"], rightButton: "search")
        NaviView(leftButton: ["back_arrow"], rightButton: "search")
        NaviView(leftButton: ["back_arrow"], title: "상세", rightButton: "search")
    }
}
