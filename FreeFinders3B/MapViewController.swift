//
//  MapViewController.swift
//  FreeFinders3B
//
//  Created by Ruxandra Nicolae on 11/7/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet private var itemMap: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad();
        
        let initialLocation = CLLocation(latitude: 41.7923, longitude: 87.6000);
        itemMap.centerToLocation(initialLocation);
        
        let userCenter = CLLocation(latitude: 41.7923, longitude: 87.6000);
        let region = MKCoordinateRegion(center: userCenter.coordinate, latitudinalMeters: 1290, longitudinalMeters: 1800);
        itemMap.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true);
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 5000);
        itemMap.setCameraZoomRange(zoomRange, animated: true);
        
       // itemMap.delegate = self

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
