//
//  WeatherList.swift
//  WeatherAppApi
//
//  Created by Sarah on 19/08/2023.
//

import SwiftUI

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
    case settings
}

struct WeatherList: View {
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
   
    var body: some View {
        
        List {
            
            ForEach(store.weatherList, id: \.id) { weather in
                WeatherCell(weather: weather)
            }
            }
        .listStyle(PlainListStyle())
      
        .sheet(item: $activeSheet, content: { (item) in
            switch item {
                case .addNewCity:
                    AddCity().environmentObject(store)
                case .settings:
                    SettingsView().environmentObject(store)
            }
        })
        
        .navigationBarItems(leading: Button(action: {
            activeSheet = .settings
        }) {
            Image(systemName: "ellipsis.circle")
                .foregroundColor(.black)
        }, trailing: Button(action: {
            activeSheet = .addNewCity
        }, label: {
            Image(systemName: "plus.circle")
                .foregroundColor(.black)
        }))
        .navigationTitle("Weather")
        .embedInNavigationView()
       
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherList().environmentObject(Store())
    }
}


struct WeatherCell: View {
    @EnvironmentObject var store: Store
    let weather: WeatherViewModel
    
    var body: some View {
        HStack {
           
            VStack(alignment: .leading, spacing: 15) {
                Text(weather.city)
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "sunrise")
                    Text("\(weather.sunrise.formatAsString())")
                }
                HStack {
                    Image(systemName: "sunset")
                    Text("\(weather.sunset.formatAsString())")
                }
            }
            Spacer()
            URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon))
                .frame(width: 50, height: 50)
            
            Text("\(Int(weather.getTemperatureByUnit(unit: store.selectedUnit))) \(String(store.selectedUnit.displayText.prefix(1)))")
        }
        .padding()
        .background(Color(.blue).opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

    }
}
