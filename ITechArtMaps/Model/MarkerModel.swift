//
//  MarkerModel.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import Foundation

class MarkerModel {
    var name: String?
    var street: String?
    public init (name: String, street: String) {
        self.name = name
        self.street = street
    }
}
