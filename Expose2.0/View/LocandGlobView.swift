//
//  LocandGlobView.swift
//  Expose
//
//  Created by Eyimofe Oladipo on 6/7/23.
//

import SwiftUI

struct LocandGlobView: View {
    @EnvironmentObject var mapData: MapUIKitViewModel
    var body: some View {
                VStack(spacing:0) {
                        Image(systemName: "photo.fill")
                            .frame(maxWidth:  .infinity, maxHeight: .infinity)
                            .padding(.bottom, 1)
                            .foregroundColor(.primary)
                    Divider()
                        .frame(width: 59)
                    ZStack {
                        Button {
                            mapData.focusLocation()
                        } label: {
                            Image(systemName:"location.fill")
                                .frame(maxWidth:  .infinity, maxHeight: .infinity)
                                .foregroundColor(.primary)
                                .padding(.top, 1)
                        }
                    }
                }
                .font(.title2)
                .frame(width: 50, height: 120)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        }
}
struct LocandGlobView_Previews: PreviewProvider {
    static var previews: some View {
        LocandGlobView()
            .environmentObject(MapUIKitViewModel())
    }
}
