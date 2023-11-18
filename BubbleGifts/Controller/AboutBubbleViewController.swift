//
//  AboutBubbleViewController.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 21.08.2023.
//

import UIKit

final class AboutBubbleViewController: UIViewController {
    
    private let aboutBubbleView = AboutBubbleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupView()
        addTarget()
    }
    
    private func setupView() {
        view.addSubview(aboutBubbleView)
        aboutBubbleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func addTarget() {
        aboutBubbleView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }

}

private extension AboutBubbleViewController {
    @objc func backPressed() {
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
