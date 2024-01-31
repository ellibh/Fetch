//
//  RecipeDetailView.swift
//  FetchMealApp
//
//

import SwiftUI

struct RecipeDetailsView: View {
    var curDessert: Dessert
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, content: {
                Spacer(minLength: 15)
                ScrollView(.vertical, showsIndicators: true, content: {
                    VStack {
                        Spacer()
                            .padding(.horizontal)
                        HStack (alignment: .center, content: {
                            Text(curDessert.strMeal ?? "Loading...")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                        })
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .cornerRadius(30)
                        Divider()
                    }
                    .background(Color.black)
                    .cornerRadius(30)
                    ingredientsView
                    Divider()
                    instructionView
                })
            })
        }
    }
    
    var ingredientsView: some View{
        VStack {
            HStack {
                Text("Ingredients")
                    .font(.title)
                Spacer()
            }
            .padding(.vertical)
            .padding(.horizontal)
            ForEach(0..<10) { i in
                if curDessert["strIngredient\(i)"] != nil && curDessert["strIngredient\(i)"] != "" {
                    VStack {
                        HStack {
                            Text(curDessert["strMeasure\(i)"] ?? "Loading...")
                                .fontWeight(.bold)
                            Spacer()
                            Text(curDessert["strIngredient\(i)"] ?? "Loading...")
                                .fontWeight(.medium)
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color.white)
            .cornerRadius(30)
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(30)
    }
    var instructionView: some View{
        VStack{
            HStack {
                Text("Instructions")
                    .font(.title)
                Spacer()
            }
            .padding(.all)
            if curDessert.strInstructions != nil {
                Text(curDessert.strInstructions ?? "Still loading in...")
                    .font(.body)
                    .fontWeight(.regular)
                    .padding(.all)
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(30)
            }
            Spacer()
        }
        .background(Color.blue.grayscale(0.50))
        .cornerRadius(30)
    }
}
