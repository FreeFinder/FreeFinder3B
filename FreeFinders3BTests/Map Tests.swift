//
//  MapKitTests.swift
//  MapKitTests
//
//  Created by Charlie Gravitt on 10/31/22.
//

import XCTest
import MapKit
import RealmSwift
//import Realm.Private
@testable import FreeFinders3B

final class MapKitTests: XCTestCase {
    //declaring the ViewController under test as an implicitly unwrapped optional
    var viewControllerUnderTest : ViewController!

    override func setUpWithError() throws {
        // This is where setup code is
        super.setUp()
                //get the storyboard the ViewController under test is inside
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
                //get the ViewController we want to test from the storyboard (note the identifier is the id explicitly set in the identity inspector)
        viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "MyViewController") as! ViewController
                //load view hierarchy
                if(viewControllerUnderTest != nil) {
                    viewControllerUnderTest.loadView()
                    viewControllerUnderTest.viewDidLoad()
                }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func isMapLoaded() {
        // Checks if map is loaded in the test view
        XCTAssertNotNil(viewControllerUnderTest.mapView, "There is no Map View in unit test")
    }
    func isMapReloaded() async {
        // Checks if map is loaded in the test view
        // Functino to reload the map
        await refresh()
        
        // Asserts that the map is loaded and ready to go
        //XCTAssertNotNil(viewControllerUnderTest.mapView, "There is no Map View in unit test")
        
        // Checks for the annotations on the map and if its greater than 0.
        let annotationsOnMap = await self.viewControllerUnderTest.mapView.annotations
        XCTAssertGreaterThan(annotationsOnMap.count, 0)
    }
    
    func isMapViewProper() {
        // Checks if the view controller is aligned with apple mapkit protocol
        XCTAssert(self.viewControllerUnderTest.conforms(to: MKMapViewDelegate.self), "ViewController violates MKMapViewDelegate protocol")
    }
    
    func isMapProper() {
        XCTAssertNotNil(self.viewControllerUnderTest.mapView.delegate, "MapView violates mapview delegate")
    }
    
//    no annotations yet
//    func testControllerAddsAnnotationsToMapView() {
//        // Tests if any number of annotations is on the map
//        let annotationsOnMap = self.viewControllerUnderTest.mapView.annotations
//        XCTAssertGreaterThan(annotationsOnMap.count, 0)
//    }
    
    func hasTargetAnnotation(sampleAnnotation: MKAnnotation.Type) -> Bool {
       let mapAnnotations = self.viewControllerUnderTest.mapView.annotations
       var hasTargetAnnotation = false
       for anno in mapAnnotations {
           if (anno.isKind(of: Item.self)) {
               hasTargetAnnotation = true
           }
       }
       return hasTargetAnnotation
    }

}
