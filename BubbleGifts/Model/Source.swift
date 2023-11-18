//
//  Source.swift
//  BubbleGifts
//
//  Created by Александр Андреев on 22.08.2023.
//

import Foundation

struct Source {
    static func getPromocodesArray() -> [Promo] {
        let array: [Promo] = [
            .init(promoText: "A12T4"),
            .init(promoText: "QO2N3"),
            .init(promoText: "OL3T1"),
            .init(promoText: "B8204"),
            .init(promoText: "K1L54"),
            .init(promoText: "N13T7"),
            .init(promoText: "D11T3"),
            .init(promoText: "I1K47"),
            .init(promoText: "R5W6"),
            .init(promoText: "DD1T9"),
            .init(promoText: "K4YU2"),
            .init(promoText: "B2RT6"),
            .init(promoText: "V51T5"),
            .init(promoText: "X11W1"),
            .init(promoText: "WX0T1"),
        ]
        return array
    }
    static func generateWinIndex() -> Int {
        return  Int.random(in: 0...14)
    }
    
    
}

struct Promo {
    let promoText: String
}
