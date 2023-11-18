//
//  DrinkButtons.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 21.08.2023.
//

import UIKit

final class DrinkButtons: UIStackView {
    
    public let fruitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emptyDrink"), for: .normal)
        return button
    }()
    
    public let milkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emptyDrink"), for: .normal)
        return button
    }()
    
    public let frappeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emptyDrink"), for: .normal)
        return button
    }()
    
    public let yoghurtButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emptyDrink"), for: .normal)
        return button
    }()
    
    public let toppingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emptyDrink"), for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupStackView()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupStackView() {
        axis = .horizontal
        spacing = 7
        alignment = .center
        distribution = .fillEqually
    }
    
    private func setupSubviews() {
        addArrangedSubview(fruitButton)
        addArrangedSubview(milkButton)
        addArrangedSubview(frappeButton)
        addArrangedSubview(yoghurtButton)
        addArrangedSubview(toppingsButton)
    }
    
    private func setupConstraints() {
        [fruitButton, milkButton, frappeButton, yoghurtButton, toppingsButton].forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(26.8)
                make.height.equalTo(59.2)
            }
        }
    }

}
