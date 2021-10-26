//
//  TomatoView.swift
//  TomatoHorizontalBottomMenu
//
//  Created by Tomato on 2021/10/26.
//

import UIKit

class TomatoShapeView: UIView {
	var caveInColor: UIColor
	var caveInWidth: CGFloat
	var fillColor: UIColor
	var shadowColor: UIColor
	var shadowRadius: CGFloat
	var shadowOpacity: Float
	
	init(frame: CGRect, caveInColor: UIColor, caveInWidth: CGFloat, fillColor: UIColor, shadowColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float) {
		self.caveInColor = caveInColor
		self.caveInWidth = caveInWidth
		self.fillColor = fillColor
		self.shadowColor = shadowColor
		self.shadowRadius = shadowRadius
		self.shadowOpacity = shadowOpacity
		super.init(frame: frame)
		self.backgroundColor = caveInColor
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		let shapeLayer = CAShapeLayer()
		let selfSize = self.bounds.size
		let xStart: CGFloat = (selfSize.width - caveInWidth) / 2.0
		let xHeight: CGFloat = selfSize.height
		let path = UIBezierPath()
		path.move(to: CGPoint.zero)
		path.addLine(to: CGPoint(x: xStart, y: 0.0))
		
		path.addCurve(to: CGPoint(x: xStart + 20.0, y: 7.5), controlPoint1: CGPoint(x: xStart + 0.0, y: 0.0), controlPoint2: CGPoint(x: xStart + 10.0, y: 0.4))
		path.addCurve(to: CGPoint(x: xStart + caveInWidth / 2.0, y: 20.0), controlPoint1: CGPoint(x: xStart + 30.0, y: 14.0), controlPoint2: CGPoint(x: xStart + 20.0, y: 20.0))
		
		path.addCurve(to: CGPoint(x: xStart + caveInWidth - 20.0, y: 7.5), controlPoint1: CGPoint(x: xStart + caveInWidth - 20.0, y: 20.0), controlPoint2: CGPoint(x: xStart + caveInWidth - 30.0, y: 14.0))
		path.addCurve(to: CGPoint(x: xStart + caveInWidth, y: 0.0), controlPoint1: CGPoint(x: xStart + caveInWidth - 10.0, y: 0.4), controlPoint2: CGPoint(x: xStart + caveInWidth, y: 0.0))
		
		path.addLine(to: CGPoint(x: selfSize.width, y: 0.0))
		path.addLine(to: CGPoint(x: selfSize.width, y: xHeight))
		path.addLine(to: CGPoint(x: 0.0, y: xHeight))
		path.addLine(to: CGPoint.zero)
		path.close()
		
		shapeLayer.path = path.cgPath
		shapeLayer.fillColor = fillColor.cgColor
		shapeLayer.shadowColor = shadowColor.cgColor
		shapeLayer.shadowRadius = shadowRadius
		shapeLayer.shadowOpacity = shadowOpacity
		layer.addSublayer(shapeLayer)
	}
}
