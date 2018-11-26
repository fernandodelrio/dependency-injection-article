//
//  MockNetworkProvider.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit
@testable import ContactApp

class MockNetworkProvider: Providable {
    var getRouteSuccess = true
    var getImageSuccess = true
    var useShortName = true
    var useShortDescription = true
    var shortName = "Roberto"
    var longName = "Roberto Roberto Roberto Roberto Roberto Roberto Roberto Roberto Roberto Roberto Roberto Roberto"
    var shortDescription = "Not cool guy. Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    var longDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar rutrum dui sed eleifend. Vestibulum ut erat fringilla, venenatis mi eu, pellentesque odio. Ut mattis vulputate nulla, non fermentum ante facilisis eu. Ut a erat bibendum, lacinia massa id, ornare neque. Nunc iaculis vulputate augue, nec facilisis lorem aliquam a. Nam at odio pretium tellus tincidunt gravida sollicitudin in eros. In efficitur at tortor eu vulputate. Morbi pretium molestie odio, sed malesuada dui pharetra in. Cras laoreet erat eu arcu dignissim, id interdum diam efficitur"
    
    lazy var mockImage = UIImage(named: "Mock Photo")
    
    func get<T>(_ type: T.Type, completion: @escaping (T?) -> Void) where T : Decodable, T : Encodable {
        if !getRouteSuccess {
            completion(nil)
            return
        }
        let name = useShortName ? shortName : longName
        let description = useShortDescription ? shortDescription : longDescription
        let contact = Contact(name: name,
                              photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5vpRDuDJqlCCrIUqbLTU65_V44yk1XZjwcOK1H3zkvd-F_b8m",
                              description: description)
        if let result = contact as? T {
            completion(result)
        }
    }
    
    func getImage(_ identifier: String, completion: @escaping (UIImage?) -> Void) {
        if !getImageSuccess {
            completion(nil)
            return
        }
        completion(mockImage)
    }
}
