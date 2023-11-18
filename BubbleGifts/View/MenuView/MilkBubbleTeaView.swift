//
//  MilkBubbleTeaView.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 21.08.2023.
//

import UIKit

final class MilkBubbleTeaView: UIView {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1076/852)
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    public let contentView = UIImageView(image: UIImage(named: "milkBubbleTea"))
    
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        addSubview(backButton)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.height.equalTo(UIScreen.main.bounds.height * 1076/852)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    

}
extension MilkBubbleTeaView {
    public func setupButtons(sv: DrinkButtons) {
        sv.fruitButton.setImage(UIImage(named: "emptyDrink"), for: .normal)
        sv.frappeButton.setImage(UIImage(named: "emptyDrink"), for: .normal)
        sv.milkButton.setImage(UIImage(named: "fullDrink"), for: .normal)
        sv.toppingsButton.setImage(UIImage(named: "emptyDrink"), for: .normal)
        sv.yoghurtButton.setImage(UIImage(named: "emptyDrink"), for: .normal)
        setupConstraintsForButtons(sv: sv)
    }
    
    private func setupConstraintsForButtons(sv: DrinkButtons) {
        addSubview(sv)
        sv.snp.makeConstraints { make in
            make.width.equalTo(165)
            make.height.equalTo(59)
            make.leading.equalToSuperview().offset(60)
            make.bottom.equalTo(contentView.snp.bottom).inset(80)
        }
    }
    
}
