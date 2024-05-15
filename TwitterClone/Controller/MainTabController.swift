//
//  ViewController.swift
//  TwitterClone
//
//  Created by Justin Hold on 5/7/24.
//

import UIKit

class MainTabController: UITabBarController {
	
	// MARK: - PROPERTIES
	let actionButton: UIButton = {
		let button = UIButton(type: .system)
		button.tintColor = .white
		button.backgroundColor = .twitterBlue
		button.setImage(UIImage(named: "new_tweet"), for: .normal)
		button.addTarget(MainTabController.self, action: #selector(actionButtonTapped), for: .touchUpInside)
		return button
	}()
	
	
	// MARK: - LIFECYCLE

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		configureVieControllers()
		configureUI()
	}


	// MARK: - Functions
	
	/// Configures the Tab View to be placed inside ViewDidLoad()
	func configureVieControllers() {
		
		// declare a constant for specific view
		let feed = FeedController()
		// declare a constant for the tab name
		// using the navigation controller template
		let tab1 = templateNavigationController(
			image: UIImage(named: "home_unselected"),
			rootViewController: feed
		)
		
		let explore = ExploreController()
		let tab2 = templateNavigationController(
			image: UIImage(named: "search_unselected"),
			rootViewController: explore
		)
		
		let notifications = NotificationsController()
		let tab3 = templateNavigationController(
			image: UIImage(named: "like_unselected"),
			rootViewController: notifications
		)
		
		let conversations = ConversationsController()
		let tab4 = templateNavigationController(
			image: UIImage(named: "ic_mail_outline_white_2x-1"),
			rootViewController: conversations
		)
		
		// sets the array of tabs
		viewControllers = [
			tab1,
			tab2,
			tab3,
			tab4
		]
	}
	
	/// Template to simplify declaring rootViewControllers and UIImage
	/// - Parameters:
	///   - image: Image that represents each tab (unselected)
	///   - rootViewController: The corresponding view the user selected
	/// - Returns: Embeds each UIViewController in a UINavigationController
	func templateNavigationController(
		image: UIImage?,
		rootViewController: UIViewController
	) -> UINavigationController {
		
		let nav = UINavigationController(rootViewController: rootViewController)
		nav.tabBarItem.image = image
		nav.navigationBar.barTintColor = .white
		
		return nav
	}
	
	func configureUI() {
		view.addSubview(actionButton)
		
		actionButton.anchor(
			bottom: view.safeAreaLayoutGuide.bottomAnchor,
			right: view.rightAnchor,
			paddingBottom: 64,
			paddingRight: 16,
			width: 56,
			height: 56
		)
		
		actionButton.layer.cornerRadius = 56 / 2
	}
	
	@objc func actionButtonTapped() {
		
	}
}

