//
//  Pie.swift
//  Memorize
//
//  Created by Sydykov Islam on 4/14/21.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle :Angle
    var endAngle :Angle
    var clockwise :Bool = false
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        
        let radius = min(rect.width, rect.height) / 2
        
        
        let lineStartingPoint = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(endAngle.radians))
        )
        
        p.move(to: center)
        p.addLine(to: lineStartingPoint)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: clockwise)
        p.addLine(to: center) 
        
        return p
    }
}
