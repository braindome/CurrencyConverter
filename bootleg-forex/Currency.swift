//
//  Currency.swift
//  bootleg-forex
//
//  Created by Antonio on 2023-04-15.
//

import Foundation

struct Currency : Hashable {
    var name : String
    var conversion : [[String : Double]]
}
