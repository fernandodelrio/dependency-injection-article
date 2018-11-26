//
//  ContactProvider.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

class ContactProvider: ContactProvidable {
    var provider: Providable?

    func getContact(completion: @escaping (Contact?, UIImage?) -> Void) {
        provider?.get(Contact.self) { [weak self] contact in
            guard let contact = contact else {
                completion(nil, nil)
                return
            }
            self?.provider?.getImage(contact.photoUrl) { image in
                guard let image = image else {
                    completion(nil, nil)
                    return
                }
                completion(contact, image)
            }
        }
    }
}
