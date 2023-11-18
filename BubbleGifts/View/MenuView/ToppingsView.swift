//
//  ToppingsView.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 21.08.2023.
//

import UIKit

final class ToppingsView: UIView {
    
    public let contentView = UIImageView(image: UIImage(named: "Toppings"))
    
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
        setupConstraints()
    }
    
    private func setupSubviews() {
        
        addSubview(contentView)
        addSubview(backButton)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    
    

}

extension ToppingsView {
    
    public func setupButtons(sv: DrinkButtons) {
        sv.fruitButton.setImage(UIImage(named: "emptyDrink"), for: .normal)
        sv.frappeButton.setImage(UIImage(named: "emptyDrink"), for: .normal)
        sv.milkButton.setImage(UIImage(named: "emptyDrink"), for: .normal)
        sv.toppingsButton.setImage(UIImage(named: "fullDrink"), for: .normal)
        sv.yoghurtButton.setImage(UIImage(named: "emptyDrink"), for: .normal)
        setupConstraintsForButtons(sv: sv)
    }
    
    private func setupConstraintsForButtons(sv: DrinkButtons) {
        addSubview(sv)
        sv.snp.makeConstraints { make in
            make.width.equalTo(165)
            make.height.equalTo(59)
            make.leading.equalToSuperview().offset(45)
            make.bottom.equalTo(contentView.snp.bottom).inset(30)
        }
        
    }
    
}
