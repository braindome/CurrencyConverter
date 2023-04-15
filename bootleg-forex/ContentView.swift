//
//  ContentView.swift
//  bootleg-forex
//
//  Created by Antonio on 2023-04-15.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var converter : ConverterViewModel
    @State var input : String = ""
    @State var output : String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Currency Converter")
                .font(.system(size: 48))
            Spacer()
            HStack {
                Spacer()
                Picker("test", selection: $converter.selectedCurrency.name) {
                    ForEach(converter.rates, id: \.name) { currency in
                        Text(currency.name)
                            .tag(currency.name)
                    }
                }
                TextField("Enter amount", text: $input)
                    .keyboardType(.numberPad)
                Spacer()
            }
            Spacer()
            Button(action: {
                if let outputDouble = converter.convert(sourceName: converter.selectedCurrency.name, targetName: converter.targetCurrency.name, amount: Double(input) ?? 0) {
                    output = "\(outputDouble)"
                } else {
                    output = "Error: You can't convert to the same currency."
                }
                print(output)

            }) {
                Image(systemName: "arrow.down")
                    .font(.system(size: 48))
            }
            Spacer()
            HStack {
                Spacer()
                Picker("test", selection: $converter.targetCurrency.name) {
                    ForEach(converter.rates, id: \.name) { currency in
                        Text(currency.name)
                            .tag(currency.name)
                    }
                }
                TextField("Result", text: $output)
                    .keyboardType(.numberPad)
                Spacer()
                
            }
            Spacer()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(converter: ConverterViewModel(selectedCurrency: Currency(name: "USD", conversion: []),
                                              targetCurrency: Currency(name: "SEK", conversion: [])))
    }
}
