//
//  ProfileViewController.swift
//  FreeFinderMilestone3B
//
//  Created by Ellen Chen on 11/6/22.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var signout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
            
        // TODO: connect to data
        name.text = "Jane Doe"
        email.text = "test@test.com"
    }

}
