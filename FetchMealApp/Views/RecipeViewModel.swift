//
//  RecipeViewModel.swift
//  FetchMealApp
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var dessert: Dessert?
    public var placeholders = Dessert()

    func fetchRecipe(meal : Meal) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + (meal.idMeal!))
        
        //Getting url request
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            //erroring out if can't find
            if error != nil {
                print("Error! Cannot find recipe!")
                return
            }
            
            if let data = data {
                do {
                    let reponse = try JSONDecoder().decode(Recipe.self, from: data)
                    DispatchQueue.main.async {
                        self.dessert = reponse.meals![0] //getting first meal in the response
                    }
                } catch {
                    print("Error! Could not parse the data!")
                    return
                }
            }
        }.resume()
    }
}
