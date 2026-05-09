//
//  CryptoService..swift
//  CryptoLive
//
//  Created by Vikram Kumar on 09/05/26.
//

import Foundation

class CryptoService {

    func fetchCryptos() async throws -> [Crypto] {

        let urlString =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let cryptos = try JSONDecoder().decode([Crypto].self, from: data)

        return cryptos
    }
}
