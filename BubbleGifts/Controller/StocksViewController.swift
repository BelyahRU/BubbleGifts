//
//  StocksViewController.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 21.08.2023.
//

import UIKit

final class StocksViewController: UIViewController {
    
    private let stocksView = StocksView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        setupView()
        addTarget()
    }
    
    private func addTarget() {
        stocksView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    private func setupView() {
        view.addSubview(stocksView)
        
        stocksView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

private extension StocksViewController {
    @objc func backPressed() {
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
