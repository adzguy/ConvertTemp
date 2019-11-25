//
//  ContentView.swift
//  ConvertTemp
//
//  Created by Davron on 11/25/19.
//  Copyright © 2019 Davron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tempAmount = "0"
    @State private var selectionFrom = 0
    @State private var selectionTo = 1
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var displayUnitConverted: Double {

        let doubleTempAmount = Double(tempAmount) ?? 0
        let unitSelectedFrom = tempUnits[selectionFrom]
        let unitSelectedTo = tempUnits[selectionTo]
        var converted: Double

        let fToC = (doubleTempAmount - 32) * 5/9
        let fToK = (doubleTempAmount - 32) * 5/9 + 273.15
        
        let kToC = doubleTempAmount - 273.15
        let kToF = (doubleTempAmount - 273.15) * 9/5 + 32
        
        let cToF = (doubleTempAmount * 9/5) + 32
        let cToK = doubleTempAmount + 273.15
        
        if unitSelectedFrom == "Celsius" && unitSelectedTo == "Fahrenheit" {
            converted = cToF
        }
        else if unitSelectedFrom == "Celsius" && unitSelectedTo == "Kelvin" {
            converted = cToK
        }
        else if unitSelectedFrom == "Fahrenheit" && unitSelectedTo == "Celsius" {
            converted = fToC
        }
        else if unitSelectedFrom == "Fahrenheit" && unitSelectedTo == "Kelvin" {
            converted = fToK
        }
        else if unitSelectedFrom == "Kelvin" && unitSelectedTo == "Celsius" {
            converted = kToC
        }
        else if unitSelectedFrom == "Kelvin" && unitSelectedTo == "Fahrenheit" {
            converted = kToF
        }
        else {
            converted = doubleTempAmount
        }
        
        return converted

    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $tempAmount)
                    Picker("Pick", selection: $selectionFrom) {
                        ForEach(0..<tempUnits.count) {
                            Text("\(self.tempUnits[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                .keyboardType(.numberPad)
                Section(header: Text("Convert To: ")){
                    Picker("Pick Unit", selection: $selectionTo) {
                        ForEach(0..<tempUnits.count) {
                            Text("\(self.tempUnits[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(displayUnitConverted, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Temperature Convert", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
