//
//  User.swift
//  FreeFinders3B
//
//  Created by steven arellano on 11/8/22.
//

import Foundation
import SwiftUI
import GoogleSignIn
import MapKit

class User {
    var id : String
    var email : String

    init(ID: String, mail: String){
        self.id = ID
        self.email = mail
        db_add_user()
    }
    
    private func db_add_user(){
        // add user, user might already exist (depends on sign in sign out stuff)
    }
    
    func db_format_user_as_creator(){
        // return however it needs formatting for writing item creator to db
    }
            
    func create_item(name: String, type: String, detail: String, coordinate: CLLocationCoordinate2D) async -> Bool{
        // check field validity
        await _ = Item(name: name,type: type,detail: detail,coordinate: coordinate,creator_email: self.email)
        refresh()
        return true
    }
    
    func comment(i: Item, comment: String) async -> Bool{
        return await i.add_Comment(comment: comment)

    }
    
    func delete_item(i: Item) async{
        await i.delete_Item()
    }
    
    func sign_out() -> Bool{
//        GIDSignIn.sharedInstance?.signOut()
//        return (GIDSignIn.sharedInstance() == nil)
        return false
    }
    
}




