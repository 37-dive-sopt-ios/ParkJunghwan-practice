//
//  LoginViewController.swift
//  sopt-37th-01Junior
//
//  Created by 박정환 on 10/11/25.
//

import UIKit

final class LoginViewController_Closure: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 163, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요"
        label.font = UIFont(name: "Pretendard-Bold", size:18)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: self.view.bounds.width - 40, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size:14)
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        // 텍스트 필드 좌측 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: self.view.bounds.width - 40, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size:14)
        textField.isSecureTextEntry = true
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        // 텍스트 필드 좌측 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        
        // 오른쪽 눈 버튼 추가
        let eyeButton = UIButton(type: .system)
        eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeButton.tintColor = .grey300
        eyeButton.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        eyeButton.addTarget(self, action: #selector(passwordVisibilityButtonDidTap), for: .touchUpInside)
        textField.rightView = eyeButton
        textField.rightViewMode = .always
        
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: self.view.bounds.width - 40, height: 57))
        button.backgroundColor = .primaryButton
        button.setTitle("로그인 하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - UI & Layout
    private func setUI() {
        self.view.backgroundColor = .white
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    // MARK: - Modal & Navigation
    
    // 모달
    private func presentToWelcomeVC() {
        let vc = WelcomeViewController()
        vc.name = idTextField.text
        
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    // 네비게이션
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.name = idTextField.text
        welcomeViewController.completionHandler = { [weak self] message in
            
            guard let self = self else { return }
            
            self.titleLabel.text = message
            self.idTextField.text = ""
            self.passwordTextField.text = ""
            self.loginButton.setTitle("다시 로그인하기", for: .normal)
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    @objc
    private func passwordVisibilityButtonDidTap(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

#Preview() {
    LoginViewController_Closure()
}

