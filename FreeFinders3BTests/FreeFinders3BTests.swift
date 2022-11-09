//
//  FreeFinders3BTests.swift
//  FreeFinders3BTests
//
//  Created by William Zeng on 11/7/22.
//

import XCTest
//import Realm
//import Realm.Private
@testable import FreeFinders3B

final class FreeFinders3BTests: XCTestCase {
    func testCreateItem() throws {
        // get initial state of the database
        let test_user = User(ID: "test_id", mail: "test_email")
        let items = db_get_all_items()
        
        let v_title = "title"
        let v_desc = "valid description"
            
        // valid item
        v_item = test_user.create_item(name: "test_item", type: "test_type", detail: "test_detail",  coordinate: CLLocationCoordinate2DMake(90.000, 135.000))
        XCTAssertTrue(v_item.db_item_exists())
            
        
        
        //invalid title
        let i_title1 = " HJIiikkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkmknllijlk'/;.jkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
        XCTAssertNil(test_user.create_item(name: i_title1, type: "test_type", detail: v_desc, coordinate: CLLocationCoordinate2DMake(90.000, 135.000)))
        let i_title2 = ""
        XCTAssertNil(test_user.create_item(name: i_title2, type: "test_type", detail: v_desc, coordinate: CLLocationCoordinate2DMake(90.000, 135.000)))
        
        //invalid quantity
        //let i_quantity1 = 999
        //XCTAssertNil(test_user.create_item(name: v_title, type: "test_type", detail: v_desc, coordinate: CLLocationCoordinate2DMake(90.000, 135.000), quantity: i_quantity1))
        
        //let i_quantity2 = 0
        //XCTAssertNil(test_user.create_item(name: v_title, type: "test_type", detail: v_desc, coordinate: CLLocationCoordinate2DMake(90.000, 135.000), quantity: i_quantity2))

        
        //invalid description -- empty
        let i_description1 = ""
        XCTAssertNil(test_user.create_item(name: v_title, type: "test_type", detail: i_description1, coordinate: CLLocationCoordinate2DMake(90.000, 135.000)))

        //invalid description -- too long
        let i_description2 = "HJIiikkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkmknllijlkHJIiimknllijlk'/;.jkkkkkkkkkkkkkkkkkkkkkkkkmknllijlk'/;.jkkkkkkkkkkkkkkkkkkkkkkasdfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkmknllijlkHJIiikkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkmknllijlk"
        XCTAssertNil(test_user.create_item(name: v_title, type: "test_type", detail: i_description2, coordinate: CLLocationCoordinate2DMake(90.000, 135.000)))
        
        }
        
    func testComment() throws{
        //test cases are the same but the syntax and coding has changed due to changing our database from firebase to MongoDB and separating the use cases functions and database calls
          
        //set up users and items for testing
        let test_user2 = User(ID: "test_id2", mail: "test_email2")
        let items = db_get_all_items()
        let test_item = items[0]
        let bad_item = Item(name: "not_in_the_database", type: "test_type", detail: "test_detail",  coordinate: CLLocationCoordinate2DMake(90.000, 135.000),quantity: 4, creator: test_user2)
            
        // get initial state of the comments for test_item
        let initial_comments = test_item.db_get_comments()
           
        // false: empty comment with no previous comments
        XCTAssertFalse(test_user2.comment(i: test_item, comment: ""))
            
        // false: valid comment but not valid item
        XCTAssertFalse(test_user2.comment(i: bad_item, comment: "fail"))
            
        //true: valid comment and item
        XCTAssertTrue(test_user2.comment(i: test_item, comment: "first comment"))
        var new_comments = test_item.db_get_comments()
        let i = initial_comments.count
        XCTAssertEqual("first comment", new_comments[i])
            
        //true: valid comment and item 2, make sure both comments are in database
        XCTAssertFalse(test_user2.comment(i: test_item, comment: "second comment"))
        new_comments = test_item.db_get_comments()
        XCTAssertEqual("second comment", new_comments[i+1])
            
    }
    
    func test_delete_item() throws {
        // creates valid item in the db
        // checks the item is there
        // deletes item from db
        // checks item not in db
        
        //create item and user
        let test_user = User(ID: "test_id", mail: "test_email")
            
        v_item = test_user.create_item(name: "test_item", type: "test_type", detail: "test_detail",  coordinate: CLLocationCoordinate2DMake(90.000, 135.000), quantity: 9)
        
        //checks in db
        XCTAssertTrue(v_item.db_item_exists())
        
        //deletes item
        v_item.delete_Item()
        
        //checks not in db
        XCTAssertFalse(v_item.db_item_exists())
        
    }
}
