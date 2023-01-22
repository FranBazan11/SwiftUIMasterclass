//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Juan Bazan Carrizo on 11/11/2022.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
