//
//  Crypto.swift
//  CryptoLive
//
//  Created by Vikram Kumar on 09/05/26.
//

import Foundation

struct Crypto: Identifiable, Codable {
    let id: String
    let symbol: String
    let name: String
    let current_price: Double
}
