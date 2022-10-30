//
//  MapView.swift
//  Africa
//
//  Created by Juan Bazan Carrizo on 05/10/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    }()
    
    let locations: [LocationModel] = Bundle.main.decode("locations.json")
     
    // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region, 
            annotationItems: locations) { item in
            MapAnnotation(coordinate: item.location) { 
               MapAnnotationView(location: item)
            }
        } //: Map
            .overlay(
                HStack(alignment: .center, spacing: 12, content: { 
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    VStack(alignment: .leading, spacing: 10) { 
                        HStack {
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        Divider()
                        HStack {
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                })
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .opacity(0.6)
                        .cornerRadius(8)
                )
                .padding()
                , alignment: .top
            )
    }
}

// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
