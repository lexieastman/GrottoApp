//
//  ItemView.swift
//  GrottoApp
//
//  Created by Alexandra Eastman on 1/22/25.
//
import SwiftUI
import MapKit
import CoreLocation

    
struct ItemView: View{
    let location:Location
    
    
    var body: some View{
            
        VStack {
            
            Text(location.title)
                .padding(.top, 30)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 20)
            Image(location.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:375)
            Text(location.body)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading, 20)
                    .padding(.top, 5)
            
            Spacer()
           
        }
    }
}


let example = Location(
    coordinate: CLLocationCoordinate2D(latitude: 39.6820, longitude: -77.3494),
    title: "Example Title",
    body: "A longer description so that i can see how it looks when it is more than one line to make sure that i like how it looks when it is much longer and not just one line because in reality there will probably be a lot. \n Does newline work? so this will be good if i want multiple paragraphs or for a prayer or something.",
    imageName: "grotto pic")
let example2 = Location(
    coordinate: CLLocationCoordinate2D(latitude: 39.6820, longitude: -77.3494),
    title: "Example Title 2",
    body: "making sure this works generically.",
    imageName: "grotto pic")


#Preview {
    ItemView(location: example2)
}



