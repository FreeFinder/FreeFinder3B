//
//  AppDelegate.swift
//  FreeFinders3B
//
//  Created by William Zeng on 11/7/22.
//

import UIKit
import Firebase
import FirebaseCore


class User {
    var id : String
    var email : String
    var ref: DatabaseReference!

    init(id: String, email: String){
        self.id = id
        self.email = email
    }
    
    func create_item(){
        
    }
    func comment(item_id: String, comment: String)-> Bool{
        let ref = Database.database().reference()

        var ret = false
        if (comment == ""){
            ret = false  // cannot have empty comment
        }
        else{
            // need to fix
            
            ref.child("items/\(item_id)").observeSingleEvent(of: .value, with: {(snapshot) in
                if snapshot.exists(){
                    guard let key = ref.child("items").child(item_id).child("comments").childByAutoId().key else {return}
                    ref.updateChildValues(["/items/\(item_id)/comments/\(key)" : comment])
                    ret = true
                }else{
                    ret = false
                }
            })
        }
        return ret
    }
}


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

    func application(_ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      FirebaseApp.configure()

      return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
