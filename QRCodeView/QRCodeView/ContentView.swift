//
//  ContentView.swift
//  QRCodeView
//
//  Created by Juan Francisco Bazan Carrizo on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = ""
    
    var body: some View {
        ZStack {
            VStack {
                TextField("Enter your code", text: $text)
                    .padding()
                
                Image(uiImage: UIImage(data: getQRCodeData(text: text)!)!)
                    .resizable()
                    .scaledToFit()
            }
        }
        .padding()
    }
    
    func getQRCodeData(text: String) -> Data? {
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let data = text.data(using: .ascii, allowLossyConversion: false)
        filter.setValue(data, forKey: "inputMessage")
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
