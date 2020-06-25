//
//  ButtonGradientBackgroundStyle.swift
//  iCafe
//
//  Created by Erik Mai on 25/6/20.
//  Copyright © 2020 Erik Mai. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonGradientBackgroundStyle: ButtonStyle {
    
    let startColor = Color.red
    let endColor = Color.green
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .padding(.horizontal, 20)
    }
    
}
