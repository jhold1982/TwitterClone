//
//  Extensions.swift
//  TwitterClone
//
//  Created by Justin Hold on 5/7/24.
//

import Foundation
import UIKit

extension UIView {
	
	func anchor(
		top: NSLayoutYAxisAnchor? = nil,
		left: NSLayoutXAxisAnchor? = nil,
		bottom: NSLayoutYAxisAnchor? = nil,
		right: NSLayoutXAxisAnchor? = nil,
		paddingTop: CGFloat = 0,
		paddingLeft: CGFloat = 0,
		paddingBottom: CGFloat = 0,
		paddingRight: CGFloat = 0,
		width: CGFloat? = nil,
		height: CGFloat? = nil
	) {
		
		translatesAutoresizingMaskIntoConstraints = false
		
		if let top = top {
			topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
		}
		
		if let left = left {
			leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
		}
		
		if let bottom = bottom {
			bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
		}
		
		if let right = right {
			rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
		}
		
		if let width = width {
			widthAnchor.constraint(equalToConstant: width).isActive = true
		}
		
		if let height = height {
			heightAnchor.constraint(equalToConstant: height).isActive = true
		}
	}
	
	func center(inView view: UIView, yConstant: CGFloat? = 0) {
		translatesAutoresizingMaskIntoConstraints = false
		centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
	}
	
	func centerX(
		inView view: UIView,
		topAnchor: NSLayoutYAxisAnchor? = nil,
		paddingTop: CGFloat? = 0
	) {
		translatesAutoresizingMaskIntoConstraints = false
		centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		if let topAnchor = topAnchor {
			self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
		}
	}
	
	func centerY(
		inView view: UIView,
		leftAnchor: NSLayoutXAxisAnchor? = nil,
		paddingLeft: CGFloat? = nil,
		constant: CGFloat? = 0
	) {
		translatesAutoresizingMaskIntoConstraints = false
		centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true
		
		if let leftAnchor = leftAnchor, let padding = paddingLeft {
			self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
		}
	}
	
	func setDimension(width: CGFloat, height: CGFloat) {
		translatesAutoresizingMaskIntoConstraints = false
		widthAnchor.constraint(equalToConstant: width).isActive = true
		heightAnchor.constraint(equalToConstant: height).isActive = true
	}
	
	func addConstraintsToFillView(_ view: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		anchor(
			top: view.topAnchor,
			left: view.leftAnchor,
			bottom: view.bottomAnchor,
			right: view.rightAnchor
		)
	}
}

// MARK: - UIColor
extension UIColor {
	static func rgb(
		red: CGFloat,
		green: CGFloat,
		blue: CGFloat
	) -> UIColor {
		return UIColor(
			red: red/255,
			green: green/255,
			blue: blue/255,
			alpha: 1
		)
	}
	
	static let twitterBlue = UIColor.rgb(red: 29, green: 161, blue: 242)
	static let customRed = UIColor.rgb(red: 220, green: 78, blue: 65)
	static let customPurple = UIColor.rgb(red: 128, green: 87, blue: 194)
}
