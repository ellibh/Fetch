//
//  HomeView.swift
//  FetchMealApp
//


import SwiftUI

struct HomeView: View {
    @State var search: String = ""
    @State var selectedIndex = 0
    @Namespace var animation
    @State var showSearchResult = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                VStack(alignment: .leading) {
                    ZStack {
                        HStack {
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack(spacing: 0) {
                            Text("Fetch Meal App")
                                .font(.system(size: 27, weight: .bold))
                       }
                    }
                    Divider()
                        .padding(.top, 8)
                    AllDessertView()
                        .padding(.top)
                    
                    Spacer()
                }
            })
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
