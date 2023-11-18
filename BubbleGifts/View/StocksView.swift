//
//  StocksView.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 21.08.2023.
//

import UIKit

final class StocksView: UIView {
    
    private let background = UIImageView(image: UIImage(named: "stocksBackground"))
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSubviews()
        setupConstaints()
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(backButton)
    }
    
    private func setupConstaints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
}
