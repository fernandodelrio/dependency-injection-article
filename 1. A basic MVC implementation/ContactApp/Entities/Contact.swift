//
//  Contact.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import Foundation

struct Contact: Codable {
    var name: String
    var photoUrl: String
    var description: String
    
    init(name: String, photoUrl: String, description: String) {
        self.name = name
        self.photoUrl = photoUrl
        self.description = description
    }
}
