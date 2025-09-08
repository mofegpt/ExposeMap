//
//  MapUIView.swift
//  Expose2.0
//
//  Created by Eyimofe Oladipo on 5/18/22.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapUIView: View {
    @EnvironmentObject var viewModel : MapUIViewModel
    @State private var annotationPlaces: [Place] = []
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37, longitude: -95), latitudinalMeters: 10000000, longitudinalMeters: 10000000)
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotationPlaces){ place in MapAnnotation(coordinate: place.place.location?.coordinate ?? CLLocationCoordinate2D(latitude: 37, longitude: -95) )
             {
                ZStack {
                    Button {
                        mapPinButton(with: place)
                    } label: {
                        Image(systemName: "mappin")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .padding()
                }
            }
        }
        .onReceive(viewModel.$region, perform: { region in
            // Prevent animation on map to show when opening app for the first time
            if viewModel.regionButtonClicked{
                withAnimation(.default) {
                    self.region = region
                }
            }else{self.region = region}
            
        })
        .sync($viewModel.places, with: $annotationPlaces)
//        .onAppear{
//           // MapAnnotation(coordinate: place.place.location?.coordinate ?? CLLocationCoordinate2D(latitude: 37, longitude: -95) )
//        }
//        .onAppear{
//            DispatchQueue.main.asyncAfter(deadline:.now() + 1.0){
//                viewModel.locationManagerService.checkIfLocationServiceIsEnabled()
//            }
//            viewModel.getInterest()
//        }
        
        .ignoresSafeArea()
        
    }
    
    private func mapPinButton(with place: Place){
        guard let location = place.place.location else {return}
        
        if #available(iOS 16.0, *){
            viewModel.showHalfSheetView = true
        }else{
            viewModel.showMoreInfoView = true
        }
        
        viewModel.moreInfoPlace = PlaceMarked(name: place.place.name ?? "",
                                              location: location,
                                              addressNumber: place.place.subThoroughfare ?? "",
                                              streetName:  place.place.thoroughfare ?? "",
                                              city: place.place.locality ?? "",
                                              state: place.place.administrativeArea ?? "",
                                              county: place.place.subAdministrativeArea ?? "",
                                              isoCountryCode: place.place.isoCountryCode ?? "US",
                                              country: place.place.country ?? "",
                                              zipCode: place.place.postalCode ?? "")
        viewModel.downloadYelpBusDetailData(name: place.place.name ?? "", address: "\(place.place.subThoroughfare ?? "") \(place.place.thoroughfare ?? "")", city: place.place.locality ?? "", state: place.place.administrativeArea ?? "", isoCountry: place.place.isoCountryCode ?? "US")
    }
}

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapUIView()
            .environmentObject(MapUIViewModel())
    }
}




