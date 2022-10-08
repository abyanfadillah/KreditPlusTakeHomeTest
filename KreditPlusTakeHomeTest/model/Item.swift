//
//  Item.swift
//  KreditPlusTakeHomeTest
//
//  Created by Muhammad Abyan Fadillah on 07/10/22.
//

import Foundation

/*{"id":1,"title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price":109.95,"description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category":"men's clothing","image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating":{"rate":3.9,"count":120}}*/

struct Item: Codable, CustomStringConvertible, Identifiable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: ItemRating?
    
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case image
        case rating
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        price = try values.decode(Float.self, forKey: .price)
        description = try values.decode(String.self, forKey: .description)
        category =  try values.decode(String.self, forKey: .category)
        image = try values.decode(String.self, forKey: .image)
        rating =  try values.decodeIfPresent(ItemRating.self, forKey: .rating)
        
        
        
    }
    
    init(id: Int, title: String, price: Float, description: String, category: String, image: String, rating: ItemRating?){
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category =  category
        self.image = image
        self.rating = rating
    }
    

}
