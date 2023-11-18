//
//  MainView.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 20.08.2023.
//

import UIKit
import SnapKit

final class MainView: UIView {
    
    private let background = UIImageView(image: UIImage(named: "mainBackground"))
    
    public let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menuButton"), for: .normal)
        return button
    }()
    
    public let bubleSafeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bubleSafeButton"), for: .normal)
        return button
    }()
    
    public let stocksButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "stocksButton"), for: .normal)
        return button
    }()
    
    public let aboutBubbleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "aboutBubbleButton"), for: .normal)
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
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(menuButton)
        addSubview(bubleSafeButton)
        addSubview(stocksButton)
        addSubview(aboutBubbleButton)
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(67)
            make.width.equalTo(258/393*UIScreen.main.bounds.width)
            make.height.equalTo(127/852*UIScreen.main.bounds.height)
        }
        
        bubleSafeButton.snp.makeConstraints { make in
            make.top.equalTo(menuButton.snp.bottom)
            make.width.equalTo(335/393*UIScreen.main.bounds.width)
            make.height.equalTo(230/852*UIScreen.main.bounds.height)
            make.leading.equalToSuperview()
        }
        
        stocksButton.snp.makeConstraints { make in
            make.width.equalTo(menuButton.snp.width)
            make.height.equalTo(menuButton.snp.height)
            make.top.equalTo(bubleSafeButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        aboutBubbleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(stocksButton.snp.bottom)
            make.width.equalTo(306/393*UIScreen.main.bounds.width)
            make.height.equalTo(190/852*UIScreen.main.bounds.height)
        }
        
    }
    
}
