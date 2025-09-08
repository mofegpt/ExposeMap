//
//  ProtoHomeViewModel.swift
//  Expose
//
//  Created by Eyimofe Oladipo on 6/8/23.
//

import Foundation


class ProtoHomeViewModel: ObservableObject{
    
    // More list view
    @Published var showInterestListView = false
    
    // Current Interest
    @Published var currentInterest: String? = nil
    
    @Published var interestIsClicked: Bool = false
}

