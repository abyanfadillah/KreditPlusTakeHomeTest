//
//  APIMockService.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Item], APIError>
    
    func fetchItems(url: URL?, completion: @escaping (Result<[Item], APIError>) -> Void) {
        completion(result)
    }
    
    
}
