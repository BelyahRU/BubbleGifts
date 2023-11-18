//
//  BubbleSafeViewController.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 22.08.2023.
//

import UIKit

final class BubbleSafeViewController: UIViewController {
    
    private let bubbleSafeView = BubbleSafeView()
    private var promoCollectionView: UICollectionView!
    private let promocodesArray = Source.getPromocodesArray()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(promocodesArray[AppDelegate.shared.winIndex].promoText)
        configure()
    }
    
    private func configure() {
        setupView()
        addTargets()
        setupCollVeiw()
    }
    
    private func setupView() {
        view.addSubview(bubbleSafeView)
        bubbleSafeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupCollVeiw() {
        promoCollectionView = bubbleSafeView.promocodesCollectionView
        promoCollectionView.dataSource = self
        promoCollectionView.delegate = self
        promoCollectionView.register(PromoCell.self, forCellWithReuseIdentifier: "CellIdentifier")
    }
    
    private func addTargets() {
        bubbleSafeView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        bubbleSafeView.refuseButton.addTarget(self, action: #selector(refusePressed), for: .touchUpInside)
    }
}

private extension BubbleSafeViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func refusePressed() {
        AppDelegate.shared.currentText = ""
        bubbleSafeView.couponImageView.isHidden = true
        bubbleSafeView.promo.text = ""
        AppDelegate.shared.promoIsHiden = true
    }
    
    
}

extension BubbleSafeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promocodesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as? PromoCell else {
            return UICollectionViewCell()
        }
        if indexPath.item == AppDelegate.shared.pressedIndex {
            cell.redLine.isHidden = false
        }
        cell.promo.text = promocodesArray[indexPath.item].promoText
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if AppDelegate.shared.touch == true {
            AppDelegate.shared.pressedIndex = indexPath.item
            let cell = collectionView.cellForItem(at: indexPath) as! PromoCell
            cell.redLine.isHidden = false
            
            if indexPath.item == AppDelegate.shared.winIndex {
                AppDelegate.shared.currentText = promocodesArray[indexPath.item].promoText
                bubbleSafeView.promo.text = AppDelegate.shared.currentText
                AppDelegate.shared.promoIsHiden = false
                bubbleSafeView.couponImageView.isHidden = false
            } else {
                let alert = UIAlertController(title: "ERROR", message: "Wrong coupon", preferredStyle: .alert)
                if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                    viewController.present(alert, animated: true, completion: nil)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    alert.dismiss(animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "ERROR", message: "Сome back in 3 days to get a new coupon", preferredStyle: .alert)
            if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                viewController.present(alert, animated: true, completion: nil)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                alert.dismiss(animated: true, completion: nil)
            }
            print(AppDelegate.shared.currentText)
        }
        AppDelegate.shared.touch = false
    }

}
