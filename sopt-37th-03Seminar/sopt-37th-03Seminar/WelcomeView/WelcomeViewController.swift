//
//  WelcomeViewController.swift
//  sopt-37th-01Junior
//
//  Created by 박정환 on 10/11/25.
//

import Foundation
import UIKit
import SnapKit

protocol WelcomeReloginDelegate: AnyObject {
    func retryLogin(_ viewController: UIViewController, didTapReloginWith message: String)
}

final class WelcomeViewController: UIViewController {
    
    var name: String?
    weak var delegate: WelcomeReloginDelegate?
    
    // MARK: - UI Components

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "???님\n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var goHomeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryButton
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .grey200
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        self.view.backgroundColor = .white
        setLayout()
        
        bindID()
    }
    
    // MARK: - Layout

    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        goHomeButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(17)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.top.equalTo(goHomeButton.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(58)
            
        }
    }
    
    private func bindID() {
        guard let username = name else { return }
        self.welcomeLabel.text = "\(username)님 \n반가워요!"
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        delegate?.retryLogin(self, didTapReloginWith: "다시 로그인 버튼을 눌렀어요!")
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

#Preview() {
    WelcomeViewController()
}
