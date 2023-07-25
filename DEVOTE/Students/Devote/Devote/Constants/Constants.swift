//
//  Constants.swift
//  Devote
//
//  Created by Juan Bazan Carrizo on 22/07/2023.
//

import SwiftUI


let backgroundGradient: LinearGradient = {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}()

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
