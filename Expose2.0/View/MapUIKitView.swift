//
//  MapaUIKitView.swift
//  Expose
//
//  Created by Eyimofe Oladipo on 6/7/23.
//

import SwiftUI
import CoreLocation

struct MapUIKitView: View {
    @StateObject var mapData = MapUIKitViewModel()
    // Location Manager...
    @State var locationManager = CLLocationManager()
    var body: some View {
        ZStack{
            MapViewUiKit()
                .environmentObject(mapData)
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    LocandGlobView()
                }
                .padding()
            }
            .environmentObject(mapData)

        }
        .onAppear {
            // Setting Delegate
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        }
        .alert(isPresented:$mapData.permissionDenied) {
            Alert(title: Text("Permission Denied"), message:  Text("Please Enable Permission In App Settings"),dismissButton: .default(Text("Go to Settings"), action: {
                // Redirecting User
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        }
    }
}

struct MapaUIKitView_Previews: PreviewProvider {
    static var previews: some View {
        MapUIKitView()
    }
}
