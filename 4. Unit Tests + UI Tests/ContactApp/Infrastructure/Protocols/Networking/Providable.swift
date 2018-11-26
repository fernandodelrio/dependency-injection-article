//
//  Providable.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

protocol Providable {
    func get<T: Codable>(_ type: T.Type, completion: @escaping (T?) -> Void)
    func getImage(_ identifier: String, completion: @escaping (UIImage?) -> Void)
}
