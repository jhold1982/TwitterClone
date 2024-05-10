//
//  NotificationsController.swift
//  TwitterClone
//
//  Created by Justin Hold on 5/7/24.
//

import Foundation
import UIKit

class NotificationsController: UIViewController {
	
	// MARK: - Properties
	
	
	
	// MARK: - ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureUI()
	}
	
	
	// MARK: - Functions
	
	func configureUI() {
		view.backgroundColor = .white
		navigationItem.title = "Notifications"
	}
	
}
