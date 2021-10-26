//
//  BaseViewController.swift
//  TomatoHorizontalBottomMenu
//
//  Created by Tomato on 2021/10/26.
//

import UIKit
import TomatoHorizontalMenuFramework

class BaseViewController: TomatoHorizontalViewController {
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
		super.init(nibName: nil, bundle: nil)
	}
	
	convenience init() {
		self.init(nibName: nil, bundle: nil)
	}
	
	func setup(index: Int) {
		menuHasCaveIn = true
		menuCaveInColor = UIColor.clear
		menuCaveInWidth = 160.0
		menuFillColor = UIColor.black
		menuHeight = 80.0
		menuHasShadow = true
		menuShadowColor = UIColor.black
		menuShadowRadius = 4.0
		menuShadowOpacity = 0.4
		/* line */
		menuHasLine = true
		lineColor = UIColor.white.withAlphaComponent(0.6)
		lineWeight = 0.5
		/* image */
		imageSize = 36.0
		/* label */
		labelTextSize = 13.0
		labelTop = 4.0
		labelHeight = 16.0
		labelNormalColor = .white
		labelHighlightColor = .green
		
		let model0 = TomatoHorizontalMenuModel(name: "HOME", imageName: "CookingImage", index: 0)
		let model1 = TomatoHorizontalMenuModel(name: "SHOP", imageName: "ClockImage", index: 1)
		let model2 = TomatoHorizontalMenuModel(name: "ORDER", imageName: "GiftImage", index: 2)
		let model3 = TomatoHorizontalMenuModel(name: "HISTORY", imageName: "ChestImage", index: 3)
		let model4 = TomatoHorizontalMenuModel(name: "SPORTS", imageName: "PlayImage", index: 4)
		tomatoModels = [model0, model1, model2, model3, model4]
		tomatoSetup(index: index)
	}
	
	override func menuTapped(_ sender: UITapGestureRecognizer) {
		if let tag = sender.view?.tag {
			if tag == 0 {
				if let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
					navigationController?.pushViewController(viewController, animated: false)
				}
			}
			else if tag == 1 {
				if let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController {
					navigationController?.pushViewController(viewController, animated: false)
				}
			}
		}
	}
}
