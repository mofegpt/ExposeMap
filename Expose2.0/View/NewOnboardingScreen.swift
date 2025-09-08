//
//  NewOnboardingScreen.swift
//  Expose
//
//  Created by Eyimofe Oladipo on 6/13/22.
//

import SwiftUI

struct NewOnboardingScreen: View {
    @StateObject var viewModel = OnBoardingScreenViewModel()
    
    @AppStorage("onBoarding") var onBoarding =  0
    @State private var currentStop = 0
    @State private var toggleGetExposedButton = false
    var body: some View {
        ZStack {
            Color("Turquoise")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    Text("Skip")
                        .foregroundColor(.white)
                        .onTapGesture {
                            withAnimation(.default, {
                                currentStop = 2
                            })
                        }
                    
                }
                .padding(16)
                
                TabView(selection: $currentStop) {
                    ForEach(0..<3) { steps in
                            VStack {
                                Image(systemName: viewModel.OnBoardingStepArray[steps].Image)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.red)
                                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
                                
                            Text(viewModel.OnBoardingStepArray[steps].Text)
                                .font(.title2)
                                .fontWeight(.black)
                                .multilineTextAlignment(.center)
                                //.font(.title2)
                                .padding(.horizontal,32)
                                .padding(.top,16)
                                .foregroundColor(.white)
                        }
//                        //.tag(steps)
                    }
  
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                
            }
            VStack{
                Spacer()
                if currentStop == 2{
                    continueButton()
                        .foregroundColor(.primary)
                        .onTapGesture {
                            onBoarding = 1
                        }
                }
            }
        }
    }
}

struct NewOnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewOnboardingScreen()
    }
}


struct continueButton: View{
    var body: some View {
        
        VStack {
            Text("GET STARTED")
                .font(.title2)
                .fontWeight(.black)
                .padding(16)
                .foregroundColor(Color("Turquoise"))
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(16)
                .padding(.horizontal, 16)
        }
        
    }
}
