//
//  User.swift
//  APIUserContactproj0805
//
//  Created by Shreyas on 08/05/25.
//

import Foundation

struct User: Codable , Identifiable{
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let address: Address
    let company: Company
    
    struct Address: Codable{
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Geo
        
        struct Geo: Codable{
            let lat: String
            let lng: String
        }
    }
    
    struct Company: Codable{
        let name: String
        let catchPhrase: String
        let bs: String
        
    }
}
