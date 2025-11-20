//
//  ChatViewController.swift
//  sopt-37th-03Seminar
//
//  Created by 박정환 on 11/1/25.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let tableView = UITableView(frame: .zero, style: .plain) // 테이블 뷰 객체 초기화
    
    // MARK: - Properties
    
    private var chatRooms: [ChatRoomModel] = []
    
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        register()
        setDelegate()
    }
    
    // MARK: - UI Setup
    
    private func register() { // 셀 등록
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate() { // 누구한테 짬 때릴건지 채택!
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUI() {  // 기본 속성 정의
        view.backgroundColor = .white
        title = "채팅"
        tableView.separatorStyle = .singleLine
    }
    
    private func setLayout() {           // 레이아웃 잡기~!
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(chatRooms[indexPath.row].name) 채팅방 선택됨")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(chatRoom: chatRooms[indexPath.row])
        return cell
    }
}

#Preview() {
    ChatViewController()
}
