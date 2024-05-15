//
//  LoginController.swift
//  TwitterClone
//
//  Created by Justin Hold on 5/10/24.
//

import Foundation
import UIKit

class LoginController: UIViewController {
	
	// MARK: - Properties
	private let logoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		imageView.image = UIImage(imageLiteralResourceName: "TwitterLogo")
		return imageView
	}()
	
	private lazy var emailContainerView: UIView = {
		
		let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
		let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
		
		return view
	}()
	
	private lazy var passwordContainerView: UIView = {
		
		let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
		let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)
		
		return view
	}()
	
	private let emailTextField: UITextField = {
		let textField = Utilities().textField(withPlaceholder: "Email")
		return textField
	}()
	
	private let passwordTextField: UITextField = {
		let textField = Utilities().textField(withPlaceholder: "Password")
		textField.isSecureTextEntry = true
		return textField
	}()
	
    // MARK: - View Did Load
	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}
	
	
	// MARK: - Functions
	func configureUI() {
		view.backgroundColor = .twitterBlue
		navigationController?.navigationBar.barStyle = .black
		navigationController?.navigationBar.isHidden = true
		
		view.addSubview(logoImageView)
		logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
		
		logoImageView.setDimension(width: 150, height: 150)
		
		let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
		stack.axis = .vertical
		stack.spacing = 8
		
		view.addSubview(stack)
		stack.anchor(
			top: logoImageView.bottomAnchor,
			left: view.leftAnchor,
			right: view.rightAnchor,
			paddingLeft: 16,
			paddingRight: 16
		)
	}
}
