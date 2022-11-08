// Copy of main file
//  main.swift
//  FreeFinderMilestone3B
//
//  Created by Charlie Gravitt on 11/2/22.
//

import Foundation
import SwiftUI
import GoogleSignIn
import MapKit

func refresh()-> [Item]{
    let items = db_get_all_items()
    for item in items{
        continue
        //itemMap.addAnnotation(item)
    }
    return items
}

private func db_get_all_items()->[Item]{
    // for each item in database, initialize an item object and put in list
    return []
}


func sign_in() -> User?{
//    GIDSignIn.sharedInstance().restorePreviousSignIn()
//    var u = GIDSignIn.sharedInstance().currentUser
//    if u != nil{
//        let mail = u?.profile.email
//        let ID = u?.userID
//        return User(ID: ID, mail: mail)
//    }
//    GIDSignIn.sharedInstance()?.signIn()
//    u = GIDSignIn.sharedInstance().currentUser
//    if u != nil{
//        let mail = u?.profile.email
//        let ID = u?.userID
//        //TODO: add to DB
//        return User(ID: ID, mail: mail)
//    }else{
//        return nil
//    }
    
    return nil;
}

