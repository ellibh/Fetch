//
//  AllDessertView.swift
//  FetchMealApp
//

import SwiftUI

struct AllDessertView: View {
    @ObservedObject private var viewDessertModel = DessertViewModel()
    @ObservedObject private var viewRecipeModel = RecipeViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                HStack (alignment: .center, content: {
                    Image(systemName: "birthday.cake")
                        .font(.system(size: 35))
                    Text("Desserts")
                        .font(.title)
                        .foregroundColor(.white)
                })
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.vertical)
                Divider()
            }
            .background(Color.blue.grayscale(/*@START_MENU_TOKEN@*/0.50/*@END_MENU_TOKEN@*/))
            .cornerRadius(30)
            
            VStack {
                ForEach(viewDessertModel.items ?? viewDessertModel.defaults, id: \.idMeal) { item in
                    NavigationLink(
                        destination: 
                            RecipeDetailsView(curDessert: viewRecipeModel.dessert ?? viewRecipeModel.placeholders)
                                .onAppear{
                                    viewRecipeModel.fetchRecipe(meal: item)
                                },
                        label: {
                            AllRecipeView(item: item)
                        })
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            viewDessertModel.fetchDesserts()
        }
    }
}

struct AllRecipeView: View {
    var item: Meal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            HStack(alignment: .top) {
                titleView
                .padding([.leading, .bottom])
                .padding(.leading)
                Spacer()
                dessertListView
            }
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
        }
        )
    }
    
    var titleView: some View{
        VStack(alignment: .leading, spacing: 8) {
            Text(item.strMeal ?? "Loading...")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .padding(.top)
                .redacted(reason: item.strMeal == nil ? .placeholder : .init())
        }
    }
    
    var dessertListView: some View{
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(systemName: "fork.knife.circle.fill")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 25))
                Text("Recipe")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .redacted(reason: item.strMeal == nil ? .placeholder : .init())
            }
            .padding(6)
            .background(Color.white.opacity(0.4))
        }
    }
}

struct NewRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        AllDessertView()
    }
}
