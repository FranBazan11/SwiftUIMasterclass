//
//  CardView.swift
//  LearnByDoing
//
//  Created by Juan Bazan Carrizo on 27/09/2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    let cardModel: CardModel
    @State private var isFaneIn: Bool = false
//    @State private var moveDownward: Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(cardModel.imageName)
                .opacity(isFaneIn ? 1 : 0)
            VStack {
                Text(cardModel.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Text(cardModel.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
                Spacer()
                Button {
                    playSound(sound: "sound-chime", type: "mp3")
                    hapticImpact.impactOccurred()
                    self.showAlert.toggle()
                } label: {
                    HStack {
                        Text(cardModel.callToAction.uppercased())
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .tint(.accentColor)
                        Image(systemName: "arrow.right.circle")
                            .foregroundColor(.white)
                            .font(.title.weight(.medium))
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(LinearGradient(gradient: Gradient(colors: cardModel.gradientColors), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                }
            } //: VStack
            .padding(.bottom, 35)
            .padding(.top, 25)
        }
        .frame(height: 545)
        .background(LinearGradient(gradient: Gradient(colors: cardModel.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        // ANIMATION
        .onAppear {
            withAnimation(.linear(duration: 1.2)) {
                self.isFaneIn.toggle()
            }
        }
        
        .alert(cardModel.title, isPresented: $showAlert, actions: {
//            Button("Delete", role: .destructive) {}
            Button("OK") { }
            Button("Stop", role: .cancel) {}
        }, message: {
            Text(cardModel.message)
        })
    }
}

// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardModel: cardData[4])
    }
}
