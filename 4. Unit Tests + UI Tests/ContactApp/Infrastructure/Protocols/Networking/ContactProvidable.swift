//
//  ContactProvidable.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

protocol ContactProvidable {
    var provider: Providable? { get set }
    func getContact(completion: @escaping (Contact?, UIImage?) -> Void)
}
