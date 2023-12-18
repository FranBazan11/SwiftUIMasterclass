//
//  ContentView.swift
//  Avocados
//
//  Created by Juan Bazan Carrizo on 15/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                AvocadosView()
                    .tabItem {
                        Image("tabicon-branch")
                            .foregroundColor(.red)
                        Text("Avocados")
                    }
                RecipesView()
                    .tabItem {
                        Image("tabicon-book")
                            .tint(Color.primary)
                        Text("Recipes")
                    }
                RipeningStagesView()
                    .tabItem {
                        Image("tabicon-avocado")
                            .tint(Color.primary)
                        Text("Ripening")
                    }
                SettingsView()
                    .tabItem {
                        Image("tabicon-settings")
                            .foregroundColor(Color.white)
                        Text("Settings")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
        }
        .tint(Color.primary)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
