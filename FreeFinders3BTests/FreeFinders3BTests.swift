//
//  FreeFinders3BTests.swift
//  FreeFinders3BTests
//
//  Created by William Zeng on 11/7/22.
//

import XCTest
import MapKit
@testable import FreeFinders3B

final class FreeFinders3BTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateItem() throws {
        // will create a various amount of items, many of which are invalid
        
        
        // get initial state of the database
        let test_user = User(ID: "test_id", mail: "test_email")
        let items = db_get_all_items()
        
        test_user.create_item(name: "test_item", type: "test_type", detail: "test_detail",  coordinate: CLLocationCoordinate2DMake(90.000, 135.000))
        
    }
    
    func testComment() throws{
        //test cases are the same but the syntax and coding has changed due to changing our database from firebase to MongoDB and separating the use cases functions and database calls
      
        //set up users and items for testing
        let test_user2 = User(ID: "test_id2", mail: "test_email2")
        let items = db_get_all_items()
        let test_item = items[0]
        let bad_item = Item(name: "not_in_the_database", type: "test_type", detail: "test_detail",  coordinate: CLLocationCoordinate2DMake(90.000, 135.000), creator: test_user2)
        
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
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
