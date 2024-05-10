//
//  FeedController.swift
//  TwitterClone
//
//  Created by Justin Hold on 5/7/24.
//

import Foundation
import UIKit

class FeedController: UIViewController {
	
	// MARK: - Properties
	
	
	
	// MARK: - ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureUI()
	}
	
	// MARK: - Functions
	
	func configureUI() {
		view.backgroundColor = .white
		
		let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
		imageView.contentMode = .scaleAspectFit
		navigationItem.titleView = imageView
	}
}
