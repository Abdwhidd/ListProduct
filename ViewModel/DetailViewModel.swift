//
//  DetailViewModel.swift
//  ListProduct
//
//  Created by Wahid on 22/07/22.
//

import Foundation
import CoreData


class DetailViewModel: ObservableObject {
    
    private var service : APIService!
    private let store = PersistentStore.shared.context
    
    @Published var productDetail : ProductDetailResponse = DETAIL_PRODUCT_RESPONSE
    @Published var isFavorite = false
    
    init() {
        self.service = APIService()
    }
    
    func getDetail(id:Int){
        self.service.getDetailProducts(id: id) { result in
            if let data = result as ProductDetailResponse? {
                DispatchQueue.main.async {
                    self.productDetail = data
                }
            }
        }
    }
    
    
    func saveProduct(id: Int, qty: Int) {
        let fv      = ProductTable(context: store)
        fv.id       = Int32(id)
        fv.qty      = Int32(qty)
        
        do {
            try self.store.save()
            isFavorite = true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func fetchProduct(id:Int) -> ProductTable? {
        var results    = [ProductTable]()
        
        let request: NSFetchRequest<ProductTable> = ProductTable.fetchRequest()
        request.predicate    = NSPredicate(format: "id == \(id)")
        
        do {
            results = try self.store.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return results.first
    }
}
