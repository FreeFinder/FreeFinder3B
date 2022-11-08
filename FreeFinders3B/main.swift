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
    // called by view controllers
    return db_get_all_items()
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
    }
    
    func create_item(){
        
    }
    
    func comment(item_id: String, comment: String)-> Bool{
        return true
    }
    
    func delete_item(item_id: String){
        
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
    private let creator: User
    let counter: Int
    let id: String
    
    init(name: String?, type: String?, coordinate: CLLocationCoordinate2D, creator: User){
        // add checks into initializer
        
        self.name = name
        self.type = type
        self.coordinate = coordinate
        self.creator = creator
        self.comments = []
        self.counter = 0
        
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
    
    private func db_delete_item(){
        // delete self from DB
    }
    
    private func db_get_comments()->[String]{
        // get current comments
    }
    
    private func db_add_comment(String c){
        // add passed comment to db
    }
    
    func add_Comment(String c) -> Bool{
        
    }
    
    func delete_Item() -> Bool{
        
    }
    
    
    
    
}



