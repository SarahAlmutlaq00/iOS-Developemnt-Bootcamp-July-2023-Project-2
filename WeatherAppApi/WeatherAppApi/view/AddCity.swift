//
//  AddCity.swift
//  WeatherAppApi
//
//  Created by Sarah on 19/08/2023.
//

import SwiftUI

struct AddCity: View {
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var addWeatherVM = AddWeatherViewModel()
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                TextField("Enter city", text: $addWeatherVM.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add") {
                  
                    addWeatherVM.save { weather in
                        store.addWeather(weather)
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }
                .padding(10)
                .font(.title3)
                .bold()
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }.padding()
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
         Spacer()
        }.padding()
        
        .navigationTitle("Search City")
        
        .embedInNavigationView()

    }
}

struct AddCity_Previews: PreviewProvider {
    static var previews: some View {
        AddCity().environmentObject(Store())

    }
}
