//
//  SettingsView.swift
//  Fructus
//
//  Created by Juan Bazan Carrizo on 24/09/2022.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    //MARK:  SECTION 1
                    GroupBox {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80, alignment: .center)
                                .cornerRadius(10)
                            Text("Most fruit are naturally low in fat sodium, and calories. None have cholesterol. Fruits are sourceof many essential nutrients, incluiding potassium, dietary fiber, vitamins, and much more")
                                .font(.footnote)
                        }
                    } label: {
                        SettingsLabelView(labelText: "fructus", labelImage: "info.circle")
                    } //: GroupBox
                    
                    //MARK:  SECTION 2
                    
                    GroupBox {
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            Text(isOnboarding ? "RESTARTED" : "RESTARD")
                                .foregroundColor(isOnboarding ? Color.green : Color.secondary)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
                        )
                    } label: {
                        SettingsLabelView(labelText: "customization", labelImage: "paintbrush")
                        Divider()
                            .padding(.vertical, 4)
                    } 
                    
                    //MARK:  SECTION 3
                    GroupBox {
                        SettingsRowView(name: "Developer", content: "Fran")
                        SettingsRowView(name: "Designer", content: "Fran :)")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Webside", linkName: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(name: "SwiftUI", content: "2.0.0")
                        SettingsRowView(name: "Version", content: "1.0.0")
                    } label: {
                        SettingsLabelView(labelText: "application", labelImage: "apps.iphone")
                    }
                } //: VStack
                .navigationTitle(Text("Setting"))
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
                .padding()
            } //: ScrollView
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
