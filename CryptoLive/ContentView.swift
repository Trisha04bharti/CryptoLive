//
//  ContentView.swift
//  CryptoLive
//
//  Created by Vikram Kumar on 09/05/26.
//
import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = CryptoViewModel()
    @State var searchText : String = ""
    
    var filtercryto : [Crypto] {
        if searchText.isEmpty {
            return viewModel.cryptos
        }
        else { return viewModel.cryptos.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
      }
    }

    var body: some View {

        NavigationView {

            List(viewModel.cryptos) { crypto in

                HStack {

                    VStack(alignment: .leading, spacing: 4) {

                        Text(crypto.name)
                            .font(.headline)

                        Text(crypto.symbol.uppercased())
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Text("$\(crypto.current_price, specifier: "%.2f")")
                        .font(.headline)
                        .foregroundColor(.green)
                }
                .padding(.vertical, 6)
                
            }
            .navigationTitle("Crypto Prices")
            .task {
                await viewModel.loadCryptos()
            }
            .searchable(text: $searchText ,
                        placement: .navigationBarDrawer(displayMode: .always)
              )
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView()
}
