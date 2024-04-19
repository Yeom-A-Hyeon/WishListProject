//
//  RemotePorduct.swift
//  WishListProject
//
//  Created by A Hyeon on 4/19/24.
//

import Foundation

struct RemoteProduct: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let thumbnail: URL
}
