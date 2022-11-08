//
//  Item.swift
//  FreeFinders3B
//
//  Created by steven arellano on 11/8/22.
//

import Foundation
import SwiftUI
import GoogleSignIn
import MapKit
import RealmSwift


class Item: NSObject, MKAnnotation{
    let name: String?
    let type: String?
    let coordinate: CLLocationCoordinate2D
    var comments: [String]
    let detail: String?
    private let creator: User
    let counter: Int
    var id: String
    
    init(name: String?, type: String?, detail: String?, coordinate: CLLocationCoordinate2D, creator: User){
        self.name = name
        self.type = type
        self.coordinate = coordinate
        self.creator = creator
        self.comments = []
        self.counter = 0
        self.detail = detail
        self.id = ""
        
        super.init()
        db_add_item()
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
        return true
    }
    
    private func db_delete_item() -> Bool{
        // delete self from DB
        // returns success of deltion
        return true
    }
    
    private func db_get_comments()->[String]{
        // get current comments
        return []
    }
    
    private func db_add_comment(c : String){
        // add passed comment to db
    }
    
    func add_Comment(comment : String) -> Bool{
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
