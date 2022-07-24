//
//  HomeViewModel.swift
//  ListProduct
//
//  Created by Wahid on 21/07/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var productlist: [Product] = [Product]()
    
    func getData() {
        APIService().getProducts { result in
            guard let data = result?.data else {
                return
            }
            self.productlist = data
        }
    }
}
