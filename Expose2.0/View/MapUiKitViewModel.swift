//
//  MapUiKitViewModel.swift
//  Expose
//
//  Created by Eyimofe Oladipo on 6/7/23.
//

import Foundation
import MapKit
import CoreLocation

class MapUIKitViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var mapView = MKMapView()
    
    // Region>
    @Published var region: MKCoordinateRegion!
    // Based on Location It will set up...
    
    //Alert
    @Published var permissionDenied = false
    
    // Map Type>>
    @Published var mapType: MKMapType = .standard
    
    
    
    func focusLocation(){
        guard let _ = region else{return}
        
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .denied:
            permissionDenied.toggle()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            // If permission Given
            manager.requestLocation()
        default:
            ()
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Showing Error
        print(error.localizedDescription)
    }
    
    // Getting user region
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{return}
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        // Updating Map
        self.mapView.setRegion(self.region, animated: true)
        
        // Smooth Animation
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
}
