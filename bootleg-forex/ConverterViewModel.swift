//
//  ConverterViewModel.swift
//  bootleg-forex
//
//  Created by Antonio on 2023-04-15.
//

import Foundation
import SwiftUI

class ConverterViewModel : ObservableObject {
    @Published var selectedCurrency : Currency
    @Published var targetCurrency : Currency
    @Published var rates = [Currency]()
    
    init(selectedCurrency: Currency, targetCurrency: Currency) {
        self.selectedCurrency = selectedCurrency
        self.targetCurrency = targetCurrency
        addRates()
    }
    
    func addRates() {
        rates.append(Currency(name: "USD", conversion: [["SEK" : 8.55], ["EUR" : 0.90], ["CNY" : 3.52], ["GBP" : 0.80]]))
        rates.append(Currency(name: "SEK", conversion: [["USD" : 0.10], ["EUR" : 0.09], ["CNY" : 0.34], ["GBP" : 0.08]]))
        rates.append(Currency(name: "EUR", conversion: [["SEK" : 11.31], ["USD" : 1.11], ["CNY" : 3.91], ["GBP" : 0.89]]))
        rates.append(Currency(name: "CNY", conversion: [["SEK" : 2.94], ["EUR" : 0.26], ["USD" : 0.32], ["GBP" : 0.21]]))
        rates.append(Currency(name: "GBP", conversion: [["SEK" : 12.83], ["EUR" : 1.12], ["CNY" : 4.37], ["USD" : 1.25]]))

    }
    
    func convert(sourceName: String, targetName: String, amount: Double) -> Double? {
        let sourceCurrency = rates.first { $0.name == sourceName }
        let targetCurrency = rates.first { $0.name == targetName }

        guard let source = sourceCurrency, let target = targetCurrency  else {
            return nil
            
        }
        
        let conversionRate = source.conversion.first { $0.keys.contains(target.name)}
        
        guard let rate = conversionRate?[target.name] else {
            return nil
        }
        
        let convertedAmount = amount * rate
        
        return convertedAmount
    }
    
}
