//
//  ViewController.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 20.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    private func configure() {
        setupView()
        setupTargets()
    }
    
    private func setupView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTargets() {
        mainView.menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        mainView.bubleSafeButton.addTarget(self, action: #selector(bubleSafePressed), for: .touchUpInside)
        mainView.stocksButton.addTarget(self, action: #selector(stocksPressed), for: .touchUpInside)
        mainView.aboutBubbleButton.addTarget(self, action: #selector(aboutBubblePressed), for: .touchUpInside)
    }
}

private extension MainViewController {
    @objc func menuPressed() {
        let vc = MenuViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func bubleSafePressed() {
        let vc = BubbleSafeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func stocksPressed() {
        let vc = StocksViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func aboutBubblePressed() {
        let vc = AboutBubbleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


