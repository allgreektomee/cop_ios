//
//  TestView.swift
//  agtm
//
//  Created by yujin on 2023/06/28.
//

import SwiftUI

struct TestView: View {
    @State var isCollapsed = true
    var contentText = "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(contentText)
                .font(.title3)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 8)
            .frame(height: isCollapsed ? 30 : .infinity, alignment: .leading)
            
            Button {
                self.isCollapsed = !self.isCollapsed
            } label: {
                let title = self.isCollapsed ? "expand text" : "collapse text"
                Text(title)
                    .font(.callout)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 8)
            }
            
            Spacer()
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
