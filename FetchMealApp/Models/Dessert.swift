//
//  Dessert.swift
//  FetchMealApp
//

struct Dessert: Codable {
    var strMeal: String?
    var strInstructions: String?
    var strMealThumb: String?
    var idMeal: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    
    subscript(key: String) -> String? {
        switch key {
            case "strMeasure1": return strMeasure1
            case "strMeasure2": return strMeasure2
            case "strMeasure3": return strMeasure3
            case "strMeasure4": return strMeasure4
            case "strMeasure5": return strMeasure5
            case "strMeasure6": return strMeasure6
            case "strMeasure7": return strMeasure7
            case "strMeasure8": return strMeasure8
            case "strMeasure9": return strMeasure9
            
            case "strIngredient1": return strIngredient1
            case "strIngredient2": return strIngredient2
            case "strIngredient3": return strIngredient3
            case "strIngredient4": return strIngredient4
            case "strIngredient5": return strIngredient5
            case "strIngredient6": return strIngredient6
            case "strIngredient7": return strIngredient7
            case "strIngredient8": return strIngredient8
            case "strIngredient9": return strIngredient9
        
            default: return ""
        }
    }
}
