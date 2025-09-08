//
//  InterestListView.swift
//  Expose2.0
//
//  Created by Eyimofe Oladipo on 5/26/22.
//

import SwiftUI

struct InterestListView: View {
    @EnvironmentObject private var mapData: MapUIViewModel
    @State var currentInterest: String = ""
    var body: some View {
        ScrollView(content: {
            if mapData.interestEntities.isEmpty{
                ProgressView()
            }
            else{
                ForEach(mapData.interestEntities) { item in
                    if  let imageData = item.image,
                        let image = UIImage(data: imageData),
                        let interest = item.interest
                    {
                        Button {
                            interestButton(interest)
                        } label: {
                            InterestListComp(image: image , interest: interest)
                        }
                        .onChange(of: currentInterest) { newValue in
                            mapData.updateCurrentInterest(with: newValue)
                        }
                    }
                }
            }
        })
    }
    
    
    func interestButton(_ interest: String){
        mapData.toggleInterstListView()
        mapData.toggleInterestIsClicked()
        currentInterest = interest
        // Searching Place
        // You can use your delay time
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.mapData.searchQuery()
            //self.mapData.downloadYelpData(with: interest)
        }
    }

}

struct InterestListView_Previews: PreviewProvider {
    static var previews: some View {
        InterestListView().environmentObject(MapUIViewModel())
    }
}
