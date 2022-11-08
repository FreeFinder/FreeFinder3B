//
//  main.swift
//  FreeFinderMilestone3B
//
//  Created by Charlie Gravitt on 11/2/22.
//

import SwiftUI
import GoogleSignIn
import MapKit

public func refresh()-> [Item]{
    let items = db_get_all_items()
    for item in items{
        itemMap.addAnnotation(item)
    }
    return items
}

private func db_get_all_items()->[Item]{
    // for each item in database, initialize an item object and put in list
}


func sign_in() -> User?{
    
    GIDSignIn.sharedInstance().restorePreviousSignIn()
    var u = GIDSignIn.sharedInstance().currentUser
    if u != nil{
        let mail = u?.profile.email
        let ID = u?.userID
        return User(ID: ID, mail: mail)
    }
    GIDSignIn.sharedInstance()?.signIn()
    u = GIDSignIn.sharedInstance().currentUser
    if u != nil{
        let mail = u?.profile.email
        let ID = u?.userID
        //TODO: add to DB
        return User(ID: ID, mail: mail)
    }else{
        return nil
    }
}

class User {
    var id : String?
    var email : String?

    init(ID: String?, mail: String?){
        self.id = ID
        self.email = mail
        db_add_user()
    }
    
    private func db_add_user(){
        // add user, user might already exist (depends on sign in sign out stuff)
    }
    
    func getLoc(){
        //iteration2
    }
    
    func db_format_user_as_creator(){
        // return however it needs formatting for writing item creator to db
    }
            
    func create_item(name: String?, type: String?, detail: String?, coordinate: CLLocationCoordinate2D) -> Bool{
        // check field validity
        _ = Item(name, type, detail, coordinate, self)
        refresh()
        return true
    }
    
    func comment(i: Item, comment: String)-> Bool{
        return i.add_Comment(String: comment)

    }
    
    func delete_item(i: Item) -> Bool{
        return i.delete_Item()
    }
    
    func sign_out() -> Bool{
        GIDSignIn.sharedInstance()?.signOut()
        return (GIDSignIn.sharedInstance() == nil)
    }
    
}

class Item: NSObject, MKAnnotation{
    let name: String?
    let type: String?
    let coordinate: CLLocationCoordinate2D
    let comments: [String]
    let detail: String?
    private let creator: User
    let counter: Int
    let id: String
    
    init(name: String?, type: String?, detail: String?, coordinate: CLLocationCoordinate2D, creator: User){
        self.name = name
        self.type = type
        self.coordinate = coordinate
        self.creator = creator
        self.comments = []
        self.counter = 0
        self.detail = detail
        
        db_add_item()
        
        super.init()
    }
    
    var title: String?{
        return name
    }
    
    var subtitle: String?{
        return type
    }
    
    private func db_add_item(){
        // add self to DB
    }
    
    private func db_item_exists()-> Bool{
        // check if item is in db still
    }
    
    private func db_delete_item() ->{
        // delete self from DB
        // returns success of deltion
    }
    
    private func db_get_comments()->[String]{
        // get current comments
    }
    
    private func db_add_comment(String c){
        // add passed comment to db
    }
    
    func add_Comment(String comment) -> Bool{
        if (comment == ""){
            return false
        }
        else{
            if (self.db_item_exists()){
                self.comments.append(comment)
                self.db_add_comment(c: comment)
                refresh()
                return true
            }
            else{
                return false
            }
        }
    }
    
    func delete_Item() -> Bool{
        let ret = db_delete_item()
        refresh()
        return ret
    }
}
