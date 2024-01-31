//
//  DessertViewModel.swift
//  FetchMealApp
//

import Foundation
import SwiftUI

class DessertViewModel: ObservableObject {
    @Published var items: [Meal]?
    public var defaults = Array(repeating: Meal(), count: 10)
    
    func fetchDesserts() {
        
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Error listing Desserts")
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        self.items = response.meals
                    }
                } catch {
                    print("Error parsing data")
                    return
                }
            }
        }.resume()
    }
}
