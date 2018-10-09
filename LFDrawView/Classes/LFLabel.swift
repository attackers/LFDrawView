//
//  LFLabel.swift
//  DrewView
//
//  Created by OS X10_12_6 on 2018/9/27.
//  Copyright © 2018年 OS X10_12_6. All rights reserved.
//

import UIKit
import CoreGraphics

class LFLabel: UILabel {
    var  arcType = ArcType.arcType_none
    var  drawType = DrawType.drawType_none
    var  drawColor = UIColor.white
    var sourceHour = 0
    var sourceMinute = 0
    var sourceSecond = 0
    
    
    let codeTimer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.init(rawValue: 0), queue: DispatchQueue.global())

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
            arcTypeThreeAll(rect)
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
    
    fileprivate func arcTypeThreeAll(_ rect: CGRect) {
        
        let width = rect.width/4.0
        let x = rect.height * 0.15
        let content = UIGraphicsGetCurrentContext()
        content?.move(to: CGPoint(x: x, y: 0))
        content?.addLine(to: CGPoint(x: width - x, y: 0))
        content?.addArc(center: CGPoint(x: width - x, y: x), radius: x, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(0.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: width, y: rect.height - x))
        content?.addArc(center: CGPoint(x: width - x, y: rect.height - x), radius: x, startAngle: CGFloat(0.0 * .pi), endAngle: CGFloat(0.5 * .pi), clockwise: false)
        
        content?.addLine(to: CGPoint(x: x, y: rect.height))
        content?.addArc(center: CGPoint(x: x , y: rect.height - x), radius: x, startAngle: CGFloat(0.5 * .pi), endAngle: CGFloat(1.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: 0, y: x))
        content?.addArc(center: CGPoint(x: x, y: x), radius: x, startAngle: CGFloat(1.0 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: false)
        drawType(content!)
        
        content?.saveGState()
        
        let centenX = rect.width/2.0 - width/2.0
        var centenMaxX = width + centenX
        content?.move(to: CGPoint(x: centenX + x, y: 0))
        content?.addLine(to: CGPoint(x: centenMaxX - x, y: 0))
        content?.addArc(center: CGPoint(x: centenMaxX - x , y: x), radius: x, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(0.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: centenMaxX, y: rect.height - x))
        content?.addArc(center: CGPoint(x: centenMaxX - x, y: rect.height - x), radius: x, startAngle: CGFloat(0.0 * .pi), endAngle: CGFloat(0.5 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: centenX + x, y: rect.height))
        
        content?.addArc(center: CGPoint(x: centenX + x, y: rect.height - x), radius: x, startAngle: CGFloat(0.5 * .pi), endAngle: CGFloat(1.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: centenX, y: x))
        content?.addArc(center: CGPoint(x: centenX + x, y: x), radius: x, startAngle: CGFloat(1.0 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: false)
        drawType(content!)
        content?.saveGState()
        
        let rightX = rect.width - width
        centenMaxX = rect.width
        content?.move(to: CGPoint(x: rightX + x, y: 0))
        content?.addLine(to: CGPoint(x: centenMaxX - x, y: 0))
        content?.addArc(center: CGPoint(x: centenMaxX - x , y: x), radius: x, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(0.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: centenMaxX, y: rect.height - x))
        content?.addArc(center: CGPoint(x: centenMaxX - x, y: rect.height - x), radius: x, startAngle: CGFloat(0.0 * .pi), endAngle: CGFloat(0.5 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: rightX + x, y: rect.height))
        
        content?.addArc(center: CGPoint(x: rightX + x, y: rect.height - x), radius: x, startAngle: CGFloat(0.5 * .pi), endAngle: CGFloat(1.0 * .pi), clockwise: false)
        content?.addLine(to: CGPoint(x: rightX, y: x))
        content?.addArc(center: CGPoint(x: rightX + x, y: x), radius: x, startAngle: CGFloat(1.0 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: false)
        drawType(content!)
        content?.saveGState()
        
        let sList = selfTextToArray()
        
        let bStg = sList.2
        let baseStgRect = (bStg as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName
            : self.font,NSForegroundColorAttributeName: UIColor.red], context: nil)
        
        let baseWidth = baseStgRect.width
        let baseHeight = rect.height * 0.5 - baseStgRect.height * 0.5
        
        
        (sList.0 as NSString).draw(at: CGPoint(x: width * 0.5 - baseWidth * 0.5, y: baseHeight), withAttributes: [NSFontAttributeName
            : self.font,NSForegroundColorAttributeName: UIColor.red])
        (sList.1 as NSString).draw(at: CGPoint(x: rect.width/2.0 - baseWidth * 0.5, y: baseHeight), withAttributes: [NSFontAttributeName
            : self.font,NSForegroundColorAttributeName: UIColor.red])
        (sList.2 as NSString).draw(at: CGPoint(x: rect.width - width * 0.5 - baseWidth * 0.5, y: baseHeight), withAttributes: [NSFontAttributeName
            : self.font,NSForegroundColorAttributeName: UIColor.red])
    }
    
    fileprivate func selfTextToArray() -> (String,String,String) {
        let sText = self.text ?? "00:00:00"
        var slist: [String]?
        if sText.contains("-") {
            slist = sText.components(separatedBy: "-")
        } else if (sText.contains(":") ) {
            slist = sText.components(separatedBy: ":")
        } else {
            let nRange = NSRange(location: 0, length: 2)
            let r = Range(nRange, in: sText)
            let f = sText.substring(with: r!)
            
            let nRange1 = NSRange(location: 0, length: 2)
            let r1 = Range(nRange1, in: sText)
            let f1 = sText.substring(with: r1!)
            
            let nRange2 = NSRange(location: 0, length: 2)
            let r2 = Range(nRange2, in: sText)
            let f2 = sText.substring(with: r2!)
            
            slist?.append(f)
            slist?.append(f1)
            slist?.append(f2)
        }
        sourceHour = NSInteger(slist?.first ?? "00") ?? 0
        sourceMinute = NSInteger(slist?[1] ?? "00") ?? 0
        sourceSecond = NSInteger(slist?.last ?? "00") ?? 0
        return (slist?.first ?? "00",slist?[1] ?? "00",slist?.last ?? "00")
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

extension LFLabel {
    
    public func setupSourceTimer(_ hour: NSInteger, _ minute: NSInteger,_ second: NSInteger) {
        self.text = String(format: "%02d:%02d:%02d",hour,minute,second)
        let  baseSecond = 10
        codeTimer.scheduleRepeating(deadline: .now(), interval: .seconds(1))
        codeTimer.setEventHandler {

            if self.sourceSecond == 0 {
                
                if self.sourceMinute >= 1 {
                    self.sourceSecond = baseSecond
                    self.sourceMinute = self.sourceMinute - 1
                } else {
                    
                    if self.sourceHour > 0 {
                        self.sourceSecond = baseSecond
                        self.sourceMinute = baseSecond
                        self.sourceHour = self.sourceHour - 1

                    }   else {
                        self.codeTimer.cancel()
                    }
                }                
            } else {
                self.sourceSecond = self.sourceSecond - 1
            }
            
            DispatchQueue.main.async(execute: {
                print(self.text)
                self.text = String(format: "%02d:%02d:%02d",self.sourceHour,self.sourceMinute,self.sourceSecond)
            })
            
          
            
        }
        if #available(iOS 10.0, *) {
            codeTimer.activate()
        } else {
            codeTimer.resume()
            // Fallback on earlier versions
        }
    }
}
