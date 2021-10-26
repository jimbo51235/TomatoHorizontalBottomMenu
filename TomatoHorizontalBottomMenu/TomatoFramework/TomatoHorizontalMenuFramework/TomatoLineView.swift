//
//  LineView.swift
//  TomatoHorizontalBottomMenu
//
//  Created by Tomato on 2021/10/26.
//

import UIKit

class TomatoLineView: UIView {
	let backColor: UIColor
	
	init(frame: CGRect, backColor: UIColor) {
		self.backColor = backColor
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		let size = self.bounds.size
		
		let p1 = self.bounds.origin // top-left
		let p2 = CGPoint(x: p1.x + size.width, y: p1.y) // top-right
		let p3 = CGPoint(x: p1.x + size.width, y: size.height) // bottom-right
		let p4 = CGPoint(x: p1.x, y: size.height) // bottom-left
		
		// create the path
		let path = UIBezierPath()
		path.move(to: p1)
		path.addLine(to: p2)
		path.addLine(to: p3)
		path.addLine(to: p4)
		path.close()
		
		// fill the path
		backColor.set()
		path.fill()
	}
}
