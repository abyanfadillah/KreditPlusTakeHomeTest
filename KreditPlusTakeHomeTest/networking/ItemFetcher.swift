//
//  ItemFetcher.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import Foundation

class ItemFetcher: ObservableObject {
    
    @Published var items = [Item]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllItems()
    }
    
    func fetchAllItems() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        service.fetchItems(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let items):
                    print("--- success with \(items.count)")
                    self.items = items
                }
            }
        }
        
    }
    
    
    //MARK: preview helpers
    
    static func errorState() -> ItemFetcher {
        let fetcher = ItemFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> ItemFetcher {
        let fetcher = ItemFetcher()
        fetcher.items = [Item.example1(), Item.example2()]
        
        return fetcher
    }
}
