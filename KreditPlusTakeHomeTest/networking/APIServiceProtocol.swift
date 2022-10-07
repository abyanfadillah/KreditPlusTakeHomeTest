//
//  APIServiceProtocol.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import Foundation

protocol APIServiceProtocol {
    func fetchItems(url: URL?, completion: @escaping(Result<[Item], APIError>) -> Void)
}
