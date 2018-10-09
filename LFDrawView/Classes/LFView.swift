//
//  LFView.swift
//  DrewView
//
//  Created by OS X10_12_6 on 2018/9/27.
//  Copyright © 2018年 OS X10_12_6. All rights reserved.
//

import UIKit
import CoreGraphics
class LFView: UIView {
    var  arcType = ArcType.arcType_none
    var  drawType = DrawType.drawType_none
    var  drawColor = UIColor.white
    init(frame: CGRect, drawType: DrawType = .drawType_none, arcType: ArcType = .arcType_none, drawColor: UIColor = .white) {
        super.init(frame: frame)
        self.arcType = arcType
        self.drawType = drawType
        self.drawColor = drawColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        switch arcType {
        case .arcType_none:
            return
        case .arcType_bottom:
            arcTypeBottom(rect)
        case .arcType_full:
            arcTypeFull(rect)
        case .arcType_top:
            arcTypeTop(rect)
        case .arcType_all:
            arcTypeAll(rect)
        case .arcType_round:
            arcTypeRound(rect)
        case .arcType_ThreeAll:
            break
        }
    }
    
    fileprivate func arcTypeTop(_ rect: CGRect) {
        let content = UIGraphicsGetCurrentContext()
        content?.move(to: CGPoint(x: 10, y: 0))
        content?.addLine(to: CGPoint(x: rect.width - 10, y: 0))
        content?.addArc(center: CGPoint(x: rect.width - 15, y: 10), radius: 10, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(0.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: rect.width - 5, y: rect.height - 0))
        content?.addLine(to: CGPoint(x: 5, y: rect.height - 0))
        content?.addLine(to: CGPoint(x: 5, y: 10))
        content?.addArc(center: CGPoint(x: 15, y: 10), radius: 10, startAngle: CGFloat(1.0 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: false)
        drawType(content!)
    }
    
    fileprivate func arcTypeBottom(_ rect: CGRect){
        let content = UIGraphicsGetCurrentContext()
        content?.move(to: CGPoint(x: 10, y: 0))
        content?.addLine(to: CGPoint(x: rect.width - 5, y: 0))
        content?.addArc(center: CGPoint(x: rect.width - 15, y: rect.height - 10), radius: 10, startAngle: CGFloat(0.0 * .pi), endAngle: CGFloat(0.5 * .pi), clockwise: false)
        
        content?.addLine(to: CGPoint(x: 15, y: rect.height - 0))
        
        content?.addArc(center: CGPoint(x: 15, y: rect.height - 10), radius: 10, startAngle: CGFloat(0.5 * .pi), endAngle: CGFloat(1.0 * .pi), clockwise: false)
        
        content?.addLine(to: CGPoint(x: 5, y: 0))
        drawType(content!)
    }
    
    fileprivate func arcTypeAll(_ rect: CGRect) {
        let content = UIGraphicsGetCurrentContext()
        content?.move(to: CGPoint(x: 10, y: 0))
        content?.addLine(to: CGPoint(x: rect.width - 10, y: 0))
        content?.addArc(center: CGPoint(x: rect.width - 15, y: 10), radius: 10, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(0.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: rect.width - 5, y: rect.height - 10))
        content?.addArc(center: CGPoint(x: rect.width - 15, y: rect.height - 10), radius: 10, startAngle: CGFloat(0.0 * .pi), endAngle: CGFloat(0.5 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: 15, y: rect.height - 0))
        content?.addArc(center: CGPoint(x: 15, y: rect.height - 10), radius: 10, startAngle: CGFloat(0.5 * .pi), endAngle: CGFloat(1.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: 5, y: 10))
        content?.addArc(center: CGPoint(x: 15, y: 10), radius: 10, startAngle: CGFloat(1.0 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: false)
        drawType(content!)
    }
    
    fileprivate func arcTypeFull(_ rect: CGRect) {
        let content = UIGraphicsGetCurrentContext()
        content?.addRect(CGRect(x: 5, y: 0, width: rect.width - 10, height: rect.height - 0))
        drawType(content!)
        
    }
    
    fileprivate func arcTypeRound(_ rect: CGRect) {
        let content = UIGraphicsGetCurrentContext()
        content?.addArc(center: CGPoint(x: rect.width/2.0, y: rect.height/2.0), radius: rect.width/2.0, startAngle: 0.0 * .pi, endAngle: 2.0 * .pi, clockwise: false)
        drawType(content!)
    }
    
    fileprivate func drawType(_ content: CGContext) {
        switch drawType {
        case .drawType_fill:
            content.closePath()
            content.setFillColor(drawColor.cgColor)
            content.fillPath()
        case .drawType_Store:
            content.closePath()
            content.setStrokeColor(drawColor.cgColor)
            content.strokePath()
        case .drawType_none:
            break
        }
    }
}
