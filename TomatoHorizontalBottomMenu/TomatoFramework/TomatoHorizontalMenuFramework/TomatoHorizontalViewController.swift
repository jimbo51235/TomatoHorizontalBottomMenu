//
//  TomatoViewController.swift
//  TomatoHorizontalBottomMenu
//
//  Created by Tomato on 2021/10/26.
//

import UIKit

open class TomatoHorizontalViewController: UIViewController {
	public var menuHasCaveIn: Bool = true
	public var menuCaveInColor: UIColor = .clear
	public var menuCaveInWidth: CGFloat = 120.0
	public var menuFillColor: UIColor = .blue
	public var menuWidth: CGFloat = 80.0
	public var menuHeight: CGFloat = 80.0
	public var menuHasShadow: Bool = true
	public var menuShadowColor: UIColor = .black
	public var menuShadowRadius: CGFloat = 2.0
	public var menuShadowOpacity: Float = 0.2
	/* line */
	public var menuHasLine: Bool = true
	public var lineColor: UIColor = .white
	public var lineWeight: CGFloat = 0.5
	/* image */
	public var imageSize: CGFloat = 32.0
	/* label */
	public var labelTop: CGFloat = 4.0
	public var labelHeight: CGFloat = 16.0
	public var labelNormalColor: UIColor = .white
	public var labelHighlightColor: UIColor = .red
	public var labelTextSize: CGFloat = 14.0
	
	public var tomatoModels = [TomatoHorizontalMenuModel]()
	public func tomatoSetup(index: Int) {
		if !isHorizontalMenuModelsValid() {
			print("Invalid menu index...")
			return
		}
		if imageSize + labelTextSize + 20.0 > menuHeight {
			print("Invalid sizes...")
			return
		}
		if imageSize > menuWidth {
			print("Invalid sizes...")
			return
		}
		if lineWeight < 0.5 || lineWeight > 1.0 {
			print("The line weight must be between 0.5 and 1.0, inclusive")
			return
		}
		if menuCaveInWidth < 80.0 || menuCaveInWidth > 280.0 {
			print("Wrong cave-in width...")
			return
		}
		
		let screenSize = UIScreen.main.bounds.size
		//let menuWidth = screenSize.width / CGFloat(tomatoModels.count)
		let tomatoRect = CGRect(origin: CGPoint(x: 0.0, y: screenSize.height - menuHeight), size: CGSize(width: screenSize.width, height: menuHeight))
		let shadowColor = (menuHasShadow) ? menuShadowColor : UIColor.clear
		let shadowRadius = (menuHasShadow) ? menuShadowRadius : 0.0
		let shadowOpacity = (menuHasShadow) ? menuShadowOpacity : 0.0
		let tomatoView = (menuHasCaveIn) ? TomatoShapeView(frame: tomatoRect, caveInColor: menuCaveInColor, caveInWidth: menuCaveInWidth, fillColor: menuFillColor, shadowColor: shadowColor, shadowRadius: shadowRadius, shadowOpacity: shadowOpacity) : UIView(frame: tomatoRect)
		if !menuHasCaveIn {
			tomatoView.backgroundColor = menuFillColor
		}
		
		let topY = (menuHasCaveIn) ? screenSize.height - menuHeight + 20.0 : screenSize.height - menuHeight + 12.0
		let scrollRect = CGRect(origin: CGPoint(x: 0.0, y: topY), size: CGSize(width: screenSize.width, height: menuHeight - 20.0))
		let scrollView = UIScrollView(frame: scrollRect)
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.contentSize = CGSize(width: menuWidth * CGFloat(tomatoModels.count), height: scrollRect.height)
		
		/* line */
		if menuHasLine {
			for i in 0..<tomatoModels.count {
				if i > 0 && i < tomatoModels.count {
					let lineRect = CGRect(x: CGFloat(i) * menuWidth, y: 0.0, width: lineWeight, height: scrollRect.height)
					let lineView = TomatoLineView(frame: lineRect, backColor: lineColor)
					scrollView.addSubview(lineView)
				}
			}
		}
		
		for i in 0..<tomatoModels.count {
			let tomatoModel = tomatoModels[i]
			
			/* menu view */
			let menuRect = CGRect(x: CGFloat(i) * menuWidth, y: -20.0, width: menuWidth, height: menuHeight)
			let menuView = UIView(frame: menuRect)
			scrollView.addSubview(menuView)
			
			/* tapGesture */
			if i != index {
				menuView.tag = i
				let tapGesture = UITapGestureRecognizer(target: self, action: #selector(menuTapped(_:)))
				menuView.addGestureRecognizer(tapGesture)
			}
			
			/* imageView */
			let imageRect = CGRect(x: (menuWidth - imageSize) / 2.0, y: (menuHeight - imageSize) / 2.0, width: imageSize, height: imageSize)
			let imageView = UIImageView(frame: imageRect)
			if let image = UIImage(named: tomatoModel.imageName) {
				imageView.image = image
			} else {
				imageView.backgroundColor = UIColor.green
			}
			menuView.addSubview(imageView)
			
			/* label */
			let labelRect = CGRect(x: 0.0, y: menuHeight - labelHeight - labelTop, width: menuWidth, height: labelHeight)
			let textColor = (i == index) ? labelHighlightColor : labelNormalColor
			let label = makeLabel(rect: labelRect, text: tomatoModel.name, textSize: labelTextSize, textColor: textColor)
			menuView.addSubview(label)
		}
		view.addSubview(tomatoView)
		view.addSubview(scrollView)
	}
	
	func makeLabel(rect: CGRect, text: String, textSize: CGFloat, textColor: UIColor)-> UILabel {
		let label = UILabel(frame: rect)
		label.text = text
		label.font = UIFont.systemFont(ofSize: textSize)
		label.textAlignment = .center
		label.textColor = textColor
		return label
	}
	
	@objc open func menuTapped(_ sender: UITapGestureRecognizer) {
		
	}
	
	
	// MARK: - Validating models
	func isHorizontalMenuModelsValid() -> Bool {
		var array = [Int]()
		for i in 0..<tomatoModels.count {
			let model = tomatoModels[i]
			let index = model.index
			if index >= 0 && index < tomatoModels.count {
				if !array.contains(index) {
					array.append(index)
				}
			}
		}
		if array.count == tomatoModels.count {
			return true
		} else {
			return false
		}
	}
}

public struct TomatoHorizontalMenuModel {
	public let name: String
	public let imageName: String
	public let index: Int
	
	public init(name: String, imageName: String, index: Int) {
		self.name = name
		self.imageName = imageName
		self.index = index
	}
}

