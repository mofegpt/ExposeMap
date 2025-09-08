//
//  MapViewUIKit.swift
//  Expose
//
//  Created by Eyimofe Oladipo on 6/7/23.
//

import Foundation
import SwiftUI
import MapKit

struct MapViewUiKit: UIViewRepresentable{
    
    @EnvironmentObject var mapData: MapUIKitViewModel
    
    func makeCoordinator() -> Coordinator{
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView{
        let view = mapData.mapView
        view.showsUserLocation = true
        view.delegate = context.coordinator
        view.mapType = .hybrid
        
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context){
        
    }
    class Coordinator: NSObject, MKMapViewDelegate{
        
    }
}
