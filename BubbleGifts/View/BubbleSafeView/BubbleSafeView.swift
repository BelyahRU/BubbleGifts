//
//  BubbleSafeView.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 22.08.2023.
//

import UIKit

final class BubbleSafeView: UIView {
    
    public var layout: UICollectionViewFlowLayout!
    
    public var promocodesCollectionView: UICollectionView!
    
    
    private let cellSize = CGSize(
        width: 66.9/390*UIScreen.main.bounds.width,
        height: 31.51/844*UIScreen.main.bounds.height)
    
    private let background = UIImageView(image: UIImage(named: "bubbleSafeBackground"))
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    public let couponImageView: UIImageView = {
        let im = UIImageView(image: UIImage(named: "coupon1"))
        
        im.isHidden = AppDelegate.shared.promoIsHiden
        return im
    }()
    
    public let promo: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 0.78, blue: 0, alpha: 1)
        label.font = UIFont(name: "AlumniSans-ExtraBold", size: 36/844*UIScreen.main.bounds.height)
        //label.font = UIFont.boldSystemFont(ofSize: 36/844*UIScreen.main.bounds.height)
        label.text = AppDelegate.shared.currentText
        return label
        
    }()
    
    public let refuseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "refuseButton"), for: .normal)
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
        setupCollectionView()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupCollectionView() {
        layout = setupFlowLayout()
        promocodesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        promocodesCollectionView.backgroundColor = .clear
        promocodesCollectionView.isScrollEnabled = false
        
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.itemSize = cellSize
        return layout
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(backButton)
        addSubview(promocodesCollectionView)
        addSubview(couponImageView)
        addSubview(promo)
        addSubview(refuseButton)
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(16)
        }
        
        promocodesCollectionView.snp.makeConstraints { make in
            make.width.equalTo(207/390*UIScreen.main.bounds.width)
            make.height.equalTo(174/844*UIScreen.main.bounds.height+10)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(50/844*UIScreen.main.bounds.height)
        }
        
        couponImageView.snp.makeConstraints { make in
            make.width.equalTo(203/390*UIScreen.main.bounds.width)
            make.height.equalTo(131/844*UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50/844*UIScreen.main.bounds.height)
        }
        
        promo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(427/844*UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
        }
        
        refuseButton.snp.makeConstraints { make in
            make.width.equalTo(134)
            make.height.equalTo(66)
            make.top.equalTo(couponImageView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
    }
}


