//
//  ContactViewController.swift
//  ContactApp
//
//  Created by Fernando Bonfim
//  Copyright © 2018 Fernando Bonfim. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var photoImageView: UIImageView?
    @IBOutlet weak var loadingView: UIView?
    @IBOutlet weak var favoriteButton: UIButton?
    
    var isFavorited = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets an empty UI before the request
        nameLabel?.text = ""
        descriptionLabel?.text = ""
        photoImageView?.image = nil
        favoriteButton?.isHidden = true

        // Shows the loading
        loadingView?.isHidden = false

        // Requests the data from the server
        getContact { [weak self] contact in
            guard let contact = contact else {
                // Hides the loading if there's no contact
                self?.loadingView?.isHidden = true
                return
            }

            // Downloads the image
            self?.getImage(url: contact.photoUrl) { image in
                guard let image = image else {
                    // Hides the loading if there's no image
                    self?.loadingView?.isHidden = true
                    return
                }

                // Sets all the data in the UI
                self?.nameLabel?.text = contact.name
                self?.descriptionLabel?.text = contact.description
                self?.photoImageView?.image = image

                // Shows the favorite button
                self?.favoriteButton?.isHidden = false

                // Hides the loading when everything finishes
                self?.loadingView?.isHidden = true
            }
        }
    }

    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        isFavorited = !isFavorited
        updateFavoriteButtonStatus()
    }
    
    func updateFavoriteButtonStatus() {
        let image = isFavorited ? UIImage(named: "love-icon-selected") : UIImage(named: "love-icon-unselected")
        favoriteButton?.setImage(image, for: .normal)
    }
    
    func getContact(completion: @escaping (Contact?) -> Void) {
        guard let path = Bundle.main.path(forResource: "Endpoints", ofType: "plist"),
        let plist = NSDictionary(contentsOfFile: path) else {
            return
        }
        let baseUrl = plist["BaseUrl"] as? String ?? ""
        guard let url = URL(string: baseUrl+"contact") else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let result = try? JSONDecoder().decode(Contact.self, from: data)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
    }
    
    func getImage(url urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
}
