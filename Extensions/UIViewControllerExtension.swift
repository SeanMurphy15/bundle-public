//
//  UIViewControllerExtension.swift
//  Bundle
//
//  Created by Sean Murphy on 8/24/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation

extension UIViewController
{
	func reactiveKeyboard()
	{
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(
			target: self,
			action: #selector(UIViewController.dismissKeyboard))

		view.addGestureRecognizer(tap)
	}

	func dismissKeyboard()
	{
		view.endEditing(true)
	}
}

extension UIViewController {

	func placeLogoInNavigationBar(){

		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
		imageView.contentMode = .ScaleAspectFit
		let image = UIImage(named: "logo-bundle-full")
		imageView.image = image
		self.navigationItem.titleView = imageView

	}

}