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

let APP_ID = "freefinderapp-fggaw";

class Item: NSObject, MKAnnotation{
    let name: String
    let type: String?
    let coordinate: CLLocationCoordinate2D
    var comments: [String]
    let detail: String
    private let creator_email: String
    let counter: Int
    var id: ObjectId
    
    init(
        name: String,
        type: String?,
        detail: String,
        coordinate: CLLocationCoordinate2D,
        creator_email: String,
        id: ObjectId = ObjectId()
    ) async
    {
        self.name = name;
        self.type = type;
        self.coordinate = coordinate;
        self.creator_email = creator_email
        self.comments = []
        self.counter = 1
        self.detail = detail
        self.id = id;
        
        super.init()
        
        if (id == ObjectId()) {
            await db_add_item(
                name: name,
                type: type!,
                coordinates: coordinate,
                details: detail,
                creator_email: creator_email
            )
        }
    }
    
    var title: String? { return name }
    var subtitle: String? { return type }
    
    private func db_add_item (
        name: String,
        type: String,
        coordinates: CLLocationCoordinate2D,
        details: String,
        creator_email: String
    ) async -> ObjectId? {
        do {
            let app = App(id: APP_ID);
            let user = try await app.login(credentials: Credentials.anonymous);
            // fetch the DB
            let client = app.currentUser!.mongoClient("mongodb-atlas")
            let database = client.database(named: "freeFinder")
            let items = database.collection(withName: "items")
            
            // create an item and insert it
            let item: Document = [
                "name": AnyBSON(stringLiteral: name),
                "type": AnyBSON(stringLiteral: type),
                "latitude": AnyBSON(stringLiteral: String(coordinates.latitude)),
                "longitude": AnyBSON(stringLiteral: String(coordinates.longitude)),
                "details": AnyBSON(stringLiteral: details),
                "creator_email": AnyBSON(stringLiteral: creator_email),
                "comments": [],
                "counter": 1
            ]
            
            let objectId = try await items.insertOne(item)
            self.id = objectId.objectIdValue!;
            if (self.id.stringValue != "") {
                print("Successfully inserted item. The returned id is \(self.id)")
            }
        } catch {
            print("Login and item insertion failed: \(error.localizedDescription)")
        }
    }
    
    private func db_item_exists() async -> Bool {
        var res = false;
        
        do {
            let app = App(id: APP_ID);
            let user = try await app.login(credentials: Credentials.anonymous);
            
            // fetch the DB
            let client = app.currentUser!.mongoClient("mongodb-atlas")
            let database = client.database(named: "freeFinder")
            let items = database.collection(withName: "items")
                
            let item: Document = [
                "name": AnyBSON(stringLiteral: self.name),
                "longitude": AnyBSON(stringLiteral: String(self.coordinate.longitude)),
                "latitude": AnyBSON(stringLiteral: String(self.coordinate.latitude)),
            ]
            
            let document = try await items.findOneDocument(filter: item);
            if (document == nil) {
                print("Could not find this document in the database!");
            } else {
                print("This item exists in the database: \(String(describing: document))")
                res = true;
            }
        } catch {
            print("Checking whether an item existed failed, inconclusive: \(error.localizedDescription)")
        }
        
        return res;
    }
    
    private func db_delete_item() async -> Bool {
        var res = false;
        
        do {
            let app = App(id: APP_ID);
            let user = try await app.login(credentials: Credentials.anonymous);
            // fetch the DB
            let client = app.currentUser!.mongoClient("mongodb-atlas")
            let database = client.database(named: "freeFinder")
            let items = database.collection(withName: "items")
            
            let itemQuery: Document = [
                "name": AnyBSON(stringLiteral: self.name),
                "longitude": AnyBSON(stringLiteral: String(self.coordinate.longitude)),
                "latitude": AnyBSON(stringLiteral: String(self.coordinate.latitude)),
            ]
            
            let _ = try await items.deleteOneDocument(filter: itemQuery)
            print("Successfully deleted this item \(self.id) from the database");
            res = true;
            
        } catch {
            print("Login and item deletion failed: \(error.localizedDescription)")
        }
        
        return res;
    }
    
    private func db_get_comments() -> [String] {
        // get current comments
        return []
    }
    
    private func db_add_comment(comment : String) {
        // add passed comment to db
    }
    
    func add_Comment(comment : String) async -> Bool{
        if (comment == ""){
            return false
        }
        else {
            if (await db_item_exists()) {
                self.comments.append(comment)
                self.db_add_comment(comment: comment)
                refresh()
                return true
            }
            else{
                return false
            }
        }
    }
    
    func delete_Item() async  {
        await db_delete_item();
        refresh();
    }
}
