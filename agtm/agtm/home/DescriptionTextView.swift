//
//  DescriptionTextView.swift
//  agtm
//
//  Created by yujin on 2023/06/26.
//

import SwiftUI

struct RoundView: View {
    var body: some View {
        Rectangle()
            .cornerRadius(25, corners: .topLeft)
            .cornerRadius(25, corners: .topRight)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
    }
}
