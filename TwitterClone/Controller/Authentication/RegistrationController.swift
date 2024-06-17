//
//  RegistrationController.swift
//  TwitterClone
//
//  Created by Justin Hold on 5/14/24.
//

import Foundation
import UIKit
import Firebase

class RegistrationController: UIViewController {
	
	// MARK: - Properties
	
	private let imagePicker = UIImagePickerController()
	private var profileImage: UIImage?
	
	// Plus Photo Button + Image
	private let plusPhotoButton: UIButton = {
		let button = UIButton(type: .system)
		button.setImage(UIImage(named: "plus_photo"), for: .normal)
		button.tintColor = .white
		button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
		return button
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
	
	// Full Name Text Field Container View
	private lazy var fullNameContainerView: UIView = {
		
		let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
		let view = Utilities().inputContainerView(withImage: image, textField: fullNameTextField)
		
		return view
	}()
	
	// Username Text Field Container View
	private lazy var usernameContainerView: UIView = {
		
		let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
		let view = Utilities().inputContainerView(withImage: image, textField: usernameTextField)
		
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
	
	// Full Name Text Field
	private let fullNameTextField: UITextField = {
		let textField = Utilities().textField(withPlaceholder: "Full Name")
		return textField
	}()
	
	// Username Text Field
	private let usernameTextField: UITextField = {
		let textField = Utilities().textField(withPlaceholder: "Username")
		return textField
	}()
	
	// Sign Up Button
	private let signUpButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Sign Up", for: .normal)
		button.setTitleColor(.twitterBlue, for: .normal)
		button.backgroundColor = .white
		button.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
		button.layer.cornerRadius = 5
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
		return button
	}()
	
	// Already have an Account? - Back Button
	private let alreadyHaveAccountButton: UIButton = {
		let button = Utilities().attributedButton("Already have an account?", " Log in")
		button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
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
		
		imagePicker.delegate = self
		imagePicker.allowsEditing = true
		
		view.addSubview(plusPhotoButton)
		
		plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
		plusPhotoButton.setDimensions(width: 128, height: 128)
		
		let stack = UIStackView(arrangedSubviews: [
			emailContainerView,
			passwordContainerView,
			fullNameContainerView,
			usernameContainerView,
			signUpButton
		])
		
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .fillEqually
		
		view.addSubview(stack)
		
		stack.anchor(
			top: plusPhotoButton.bottomAnchor,
			left: view.leftAnchor,
			right: view.rightAnchor,
			paddingTop: 32,
			paddingLeft: 32,
			paddingRight: 32
		)
		
		view.addSubview(alreadyHaveAccountButton)
		alreadyHaveAccountButton.anchor(
			left: view.leftAnchor,
			bottom: view.safeAreaLayoutGuide.bottomAnchor,
			right: view.rightAnchor,
			paddingLeft: 40,
			paddingRight: 40
		)
	}
	
	// MARK: - @OBJC Functions
	@objc func handleShowLogin() {
		let controller = LoginController()
		navigationController?.popViewController(animated: true)
	}
	
	@objc func handleAddProfilePhoto() {
		present(imagePicker, animated: true, completion: nil)
	}
	
	@objc func handleSignUp() {
		guard let profileImage = profileImage else {
			print("DEBUG: Please select a profile image...")
			return
		}
		guard let email = emailTextField.text else { return }
		guard let password = passwordTextField.text else { return }
		guard let fullname = fullNameTextField.text else { return }
		guard let username = usernameTextField.text else { return }
		
		Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
			if let error = error {
				print("DEBUG: Error - \(error.localizedDescription)")
				return
			}
			
			guard let uid = result?.user.uid else { return }
			
			let values = ["email": email, "username": username, "fullname": fullname]
			
			let refDat = Database.database().reference().child("users").child(uid)
			
			refDat.updateChildValues(values) { (error, ref) in
				print("DEBUG: Successfully updated user info...")
			}
		}
	}
}

// MARK: - UIImagePickerControllerDelegate
extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(
		_ picker: UIImagePickerController,
		didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
	) {
		guard let profileImage = info[.editedImage] as? UIImage else { return }
		self.profileImage = profileImage
		
		// Rounds off photo
		plusPhotoButton.layer.cornerRadius = 128 / 2
		plusPhotoButton.layer.masksToBounds = true
		plusPhotoButton.imageView?.contentMode = .scaleAspectFill
		plusPhotoButton.imageView?.clipsToBounds = true
		plusPhotoButton.layer.borderColor = UIColor.white.cgColor
		plusPhotoButton.layer.borderWidth = 3
		
		self.plusPhotoButton.setImage(
			profileImage.withRenderingMode(.alwaysOriginal),
			for: .normal
		)
		
		
		
		dismiss(animated: true, completion: nil)
	}
}
