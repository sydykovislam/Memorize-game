//
//  Cardify.swift
//  Memorize
//
//  Created by Sydykov Islam on 4/14/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation :Double
    
    init(isFaceUp :Bool) {
        rotation = isFaceUp ? 0 : 180
        
    }

    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get {return rotation}
        set {rotation = newValue}
    }
    
    private let cornerRadius = CGFloat(10.0)
    private let emojySizeK = CGFloat(0.7)
    private let strokeLineWidth = CGFloat(3.0)
    
    func body(content: Content) -> some View {
        ZStack(content: {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: strokeLineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill()
                .opacity(isFaceUp ? 0 : 1)
            
            
        })
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))

    }
}

extension View {
    func cardify(isFaceUp :Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
