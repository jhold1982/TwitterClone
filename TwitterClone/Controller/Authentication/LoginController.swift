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
	// Twitter Logo
	private let logoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		imageView.image = UIImage(imageLiteralResourceName: "TwitterLogo")
		return imageView
	}()
	
	// Email Text Field Container View
	private lazy var emailContainerView: UIView = {
		
		let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
		let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
		
		return view
	}()
	
	// Password Text Field Container View
	private lazy var passwordContainerView: UIView = {
		
		let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
		let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)
		
		return view
	}()
	
	// Email Text Field
	private let emailTextField: UITextField = {
		let textField = Utilities().textField(withPlaceholder: "Email")
		return textField
	}()
	
	// Password Text Field
	private let passwordTextField: UITextField = {
		let textField = Utilities().textField(withPlaceholder: "Password")
		textField.isSecureTextEntry = true
		return textField
	}()
	
	// Login Button
	private let loginButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Log in", for: .normal)
		button.setTitleColor(.twitterBlue, for: .normal)
		button.backgroundColor = .white
		button.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
		button.layer.cornerRadius = 5
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
		return button
	}()
	
	// Dont Have Account Button
	private let dontHaveAccountButton: UIButton = {
		let button = Utilities().attributedButton("Don't have an account?", " Sign Up")
		button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
		return button
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
		
		let stack = UIStackView(
			arrangedSubviews: [
				emailContainerView,
				passwordContainerView,
				loginButton
			]
		)
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .fillEqually
		
		view.addSubview(stack)
		
		stack.anchor(
			top: logoImageView.bottomAnchor,
			left: view.leftAnchor,
			right: view.rightAnchor,
			paddingLeft: 32,
			paddingRight: 32
		)
		
		view.addSubview(dontHaveAccountButton)
		
		dontHaveAccountButton.anchor(
			left: view.leftAnchor,
			bottom: view.safeAreaLayoutGuide.bottomAnchor,
			right: view.rightAnchor,
			paddingLeft: 40,
			paddingRight: 40
		)
	}
	
	
	// MARK: - @OBJC Functions
	@objc func handleLogin() {
		//
	}
	
	@objc func handleShowSignUp() {
		let controller = RegistrationController()
		navigationController?.pushViewController(controller, animated: true)
	}
}
