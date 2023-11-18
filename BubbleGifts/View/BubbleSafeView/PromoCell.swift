//
//  PromoCollectionViewCell.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 22.08.2023.
//

import UIKit
import SnapKit
final class PromoCell: UICollectionViewCell {
    
    public let promo: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 0.78, blue: 0, alpha: 1)
        label.font = UIFont(name: "AlumniSans-ExtraBold", size: 19.39/844*UIScreen.main.bounds.height)
        //label.text = "A12T4"
        return label
    }()
    
    public let redLine: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "redLine")
        im.isHidden = true
        return im
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // Настройки для ячейки коллекции
        setupCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.layer.backgroundColor = UIColor(red: 0.254, green: 0.254, blue: 0.254, alpha: 0.7).cgColor
        contentView.layer.cornerRadius = 6.79
        contentView.addSubview(promo)
        contentView.addSubview(redLine)
        promo.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        redLine.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
