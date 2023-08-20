//
//  SettingsView.swift
//  WeatherAppApi
//
//  Created by Sarah on 19/08/2023.
//

import SwiftUI

enum TemperatureUnit: String, CaseIterable, Identifiable {
    
    var id: String {
        return rawValue
    }
    
    case celsius
    case fahrenheit
    case kelvin
}
extension TemperatureUnit {
    
    var displayText: String {
        switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            case .kelvin:
                return "Kelvin"
        }
    }
    
}

struct SettingsView: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @AppStorage("unit") private var selectedUnit: TemperatureUnit = .kelvin
    var body: some View {
        VStack {
            Picker(selection: $selectedUnit, label: Text("Select temperature unit?")) {
                ForEach(TemperatureUnit.allCases, id: \.self) {
                    Text("\($0.displayText)" as String)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button("Done") {
            
            mode.wrappedValue.dismiss()
            store.selectedUnit = selectedUnit
            
        })
        .embedInNavigationView()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
