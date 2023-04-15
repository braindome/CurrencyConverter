//
//  bootleg_forexApp.swift
//  bootleg-forex
//
//  Created by Antonio on 2023-04-15.
//

import SwiftUI

@main
struct bootleg_forexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(converter: ConverterViewModel(selectedCurrency: Currency(name: "USD", conversion: []),
                                                  targetCurrency: Currency(name: "SEK", conversion: [])))
        }
    }
}
