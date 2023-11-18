//
//  MenuViewController.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 20.08.2023.
//


import UIKit
import SnapKit


final class MenuViewController: UIViewController {
    private var currentView: UIView?

    private let drinkButtons = DrinkButtons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupFruitView()
        addTargets()
    }
    
    private func addTargets() {
        drinkButtons.fruitButton.addTarget(self, action: #selector(drinkButtonTapped(_:)), for: .touchUpInside)
        drinkButtons.milkButton.addTarget(self, action: #selector(drinkButtonTapped(_:)), for: .touchUpInside)
        drinkButtons.frappeButton.addTarget(self, action: #selector(drinkButtonTapped(_:)), for: .touchUpInside)
        drinkButtons.yoghurtButton.addTarget(self, action: #selector(drinkButtonTapped(_:)), for: .touchUpInside)
        drinkButtons.toppingsButton.addTarget(self, action: #selector(drinkButtonTapped(_:)), for: .touchUpInside)
    }
    
      
}
//MARK: Targets

private extension MenuViewController {
    @objc func drinkButtonTapped(_ sender: UIButton) {
        
        currentView?.removeFromSuperview()
        
        switch sender {
        case drinkButtons.fruitButton:
            setupFruitView()
            
        case drinkButtons.milkButton:
            setupMilkView()
            
        case drinkButtons.frappeButton:
            setupFrappeView()
            
        case drinkButtons.yoghurtButton:
            setupYoughurtView()
            
        case drinkButtons.toppingsButton:
            setupToppingsView()
            
        default:
            setupFruitView()
        }
    }
    
    @objc func backPressed() {
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: setup buttons in each view
private extension MenuViewController {
    private func setupFruitView() {
        let initialView = FruitBubleTeaView()
        view.addSubview(initialView)
        
        initialView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        initialView.setupButtons(sv: drinkButtons)
        initialView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        self.currentView = initialView
    }
    
    private func setupMilkView() {
        let initialView = MilkBubbleTeaView()
        view.addSubview(initialView)
        
        initialView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        initialView.setupButtons(sv: drinkButtons)
        initialView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        self.currentView = initialView
    }
    
    private func setupYoughurtView() {
        let initialView = BubbleYoughurtView()
        view.addSubview(initialView)
        
        initialView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        initialView.setupButtons(sv: drinkButtons)
        
        initialView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        self.currentView = initialView
    }
    
    private func setupToppingsView() {
        let initialView = ToppingsView()
        view.addSubview(initialView)
        
        initialView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        initialView.setupButtons(sv: drinkButtons)
        initialView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        self.currentView = initialView
    }
    
    private func setupFrappeView() {
        let initialView = BubbleFrappeView()
        view.addSubview(initialView)
        
        initialView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        initialView.setupButtons(sv: drinkButtons)
        initialView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        self.currentView = initialView
    }
}

