//
//  OnboardingView.swift
//  Fructus
//
//  Created by Juan Francisco Bazan Carrizo on 29/08/2022.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach (1..<5) { item in
                FruitCardView()
            }
        } //: Tab View
        .tabViewStyle(.page)
        .padding(.vertical, 20)
        
    }
}
// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
