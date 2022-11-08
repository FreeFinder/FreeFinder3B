//
//  ItemViewController.swift
//  FreeFinderMilestone3B
//
//  Created by Ruxandra Nicolae on 11/6/22.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemLocation: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var exit: UIButton!
    @IBOutlet weak var addComment: UIButton!
    @IBOutlet weak var newComment: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        itemImage.layer.masksToBounds = true
        itemImage.layer.cornerRadius = itemImage.bounds.width / 2
        
        // TODO: connect to data
        itemDescription.text = "Description";
        itemName.text = "Name";
        //itemLocation = "Shoes";
        //itemImage.image =
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    }
    
    @IBAction func postCommentButtonPressed(_ sender: UIButton) {
        //get information from the text field and create new comment with it
        //have to get id of the current item being observed
        //also need to access current user so they can comment
        //comment("tbd", newComment.text);
    }

}
