//
//  MainNavigationView.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 12/2/24.
//


import SwiftUI

struct MainNavigationView: View {

    var body: some View {

        
        NavigationStack{
            List (){
                Image("logo@2x")
                    .resizable()
                    .scaledToFit()
                
                Image("mary")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 450, height:375, alignment: .top)
                    .clipped()
                NavigationLink(destination: AboutView()) {
                    Text("About the Grotto")
                }
                NavigationLink(
                    destination:ContentView())
                {
                    Text("View Map")
                }
                NavigationLink(destination: DonateView()){
                    Text("Support/ Donate")
                }
                NavigationLink(destination: NearbyView()){
                    Text("See What's Nearby")
                }
                
                
            }
            
            Text("Please ensure location services are enabled (settings>apps>Grotto>Location>\"While Using the App\" [set to on]). \n The map feature works accurately when you are in close Proximity to the Grotto.")
                .font(.caption2)
            
            
            .statusBar(hidden: true)
            .edgesIgnoringSafeArea(.top)
            
            
        }
        
    }
}
