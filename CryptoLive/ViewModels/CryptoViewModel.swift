//
//  CryptoViewModel.swift
//  CryptoLive
//
//  Created by Vikram Kumar on 09/05/26.
//

import Foundation
import Combine

@MainActor
class CryptoViewModel: ObservableObject {

    @Published var cryptos: [Crypto] = []

    let service = CryptoService()

    func loadCryptos() async {

        do {
            cryptos = try await service.fetchCryptos()
        } catch {
            print("Error fetching crypto data: \(error)")
        }
    }
}
