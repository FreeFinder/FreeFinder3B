//
//  ItemsTableViewController.swift
//  FreeFinderMilestone3B
//
//  Created by Jordan Labuda on 11/6/22.
//

import UIKit
import Firebase

struct Item{
    var id : String
    var title : String
    var description : String
    
}

func make_list() -> [Item]{
    // grab all items from DB
    // make item obj for each one
    var out = [Item]
    var ref: DatabaseReference!
    ref = Database.database(url: "https://freefinder-12f0c-default-rtdb.firebaseio.com/").reference().child("items")
    
    ref.observeSingleEventOfType(.Value, withBlock { snapshot in
      for child in snapshot.children {
          let temp = Item(child.key, child.value["title"], child.value["description"])
          out.append(temp)
      }
    })

    return out
}

class ItemsTableViewController: UITableViewController {

    var items = make_list()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear()
        items = make_list()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.description
        //cell.imageView?.image = UIImage(named: item.photo)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //println(tasks[indexPath.row])
        // !!!!! need to figure out how to pass id on click, and connect to the item view

    }

    // !!!!! need to figure out how to pass id on click, and connect to the item view
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
