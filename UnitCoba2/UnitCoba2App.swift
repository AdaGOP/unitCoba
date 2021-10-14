//
//  UnitCoba2App.swift
//  UnitCoba2
//
//  Created by Haryanto Salim on 05/10/21.
//

import SwiftUI

@main
struct UnitCoba2App: App {
    var body: some Scene {
        WindowGroup {
            let mon = Monster(name: "Robot",
                                     emoji: "🤖",
                                     life: 500.0,
                                     attackPower: 100.0)
            let enemymon = Monster(name: "Pumpkin",
                                          emoji: "🎃",
                                          life: 500.0,
                                          attackPower: 140.0)
            let game = GameViewModel(yourMon: mon, enemy: enemymon)
            
            ContentView(game: game)
        }
    }
}
