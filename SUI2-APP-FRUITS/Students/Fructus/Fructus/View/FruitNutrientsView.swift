//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Juan Bazan Carrizo on 24/09/2022.
//

import SwiftUI

struct FruitNutrientsView: View {
    //MARK: - PROPERTIES
    let fruit: Fruit
    let nutrient: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals" ]
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            DisclosureGroup("Nutricional value per 100g") {
                ForEach(0..<nutrient.count, id: \.self) { item in
                    Divider()
                        .padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrient[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

//MARK: - PREVIEW
struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375.0, height: 480.0))
            .padding()
    }
}
