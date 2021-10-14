//
//  ContentView.swift
//  UnitCoba2
//
//  Created by Haryanto Salim on 05/10/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game: GameViewModel
    var body: some View {
        NavigationView{
            VStack{
                VStack {
                    MonsterView(mon: $game.enemymon)
                    MonsterView(mon: $game.mon)
                }.padding(.all, 8)
                Spacer()
                HStack {
                    if #available(iOS 15.0, *) {
                        Button {
                            print("Attack with Rock")
                            game.mon.signAttack = .rock
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .rock)
                        } label: {
                            Text("🪨")
                                .font(
                                    .system(
                                        size: 44))
                        }.buttonStyle(.borderedProminent)
                    } else {
                        // Fallback on earlier versions
                        Button {
                            print("Attack with Rock")
                            game.mon.signAttack = .rock
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .rock)
                        } label: {
                            Text("🪨")
                                .font(
                                    .system(
                                        size: 44))
                        }
                    }
                    if #available(iOS 15.0, *) {
                        Button {
                            print("Attack with Paper")
                            game.mon.signAttack = .paper
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .paper)
                        } label: {
                            Text("📄")
                                .font(
                                    .system(
                                        size: 44))
                        }.buttonStyle(.borderedProminent)
                    } else {
                        // Fallback on earlier versions
                        Button {
                            print("Attack with Paper")
                            game.mon.signAttack = .paper
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .paper)
                        } label: {
                            Text("📄")
                                .font(
                                    .system(
                                        size: 44))
                        }
                    }
                    if #available(iOS 15.0, *) {
                        Button {
                            print("Attack with Scissor")
                            game.mon.signAttack = .scissor
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .scissor)
                        } label: {
                            Text("✂️")
                                .font(
                                    .system(
                                        size: 44))
                        }.buttonStyle(.borderedProminent)
                    } else {
                        // Fallback on earlier versions
                        Button {
                            print("Attack with Scissor")
                            game.mon.signAttack = .scissor
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .scissor)
                        } label: {
                            Text("✂️")
                                .font(
                                    .system(
                                        size: 44))
                        }
                    }
                }
                Spacer()
            }.navigationTitle("Fight")
        }
    }
}

struct MonsterView: View {
    @Binding var mon: Monster
    var body: some View {
        VStack {
            ZStack {
                Text(mon.emoji)
                    .font(
                        .system(
                            size: 150))
                if mon.life <= 0 {
                    Text("❌")
                        .font(
                            .system(
                                size: 150))
                }
                VStack {
                    Text("👊\(String(format: "%.2f", mon.attackPower))")
                }.offset(x: -50, y: -70)
                Text("❤️\(String(format: "%.2f", mon.life))").offset(y: 90)
            }
            Text("\(mon.name)")
                .font(
                    .system(
                        size: 20, weight: .bold))
            
            if let currAttack = mon.signAttack {
                Text("\(translate(currAttack))")
                    .font(
                        .system(
                            size: 44))
            }
        }.padding(.all, 8)
//            .background(Color.green)
            .cornerRadius(10)
    }
    
    func translate(_ currAttack: AttackType) -> String {
        switch currAttack{
        case .rock:
            return "🪨"
        case .paper:
            return "📄"
        case .scissor:
            return "✂️"
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let mon = Monster(name: "Robot",
                          emoji: "🤖",
                          life: 1000.0,
                          attackPower: 100.0)
        let enemymon = Monster(name: "Pumpkin",
                               emoji: "🎃",
                               life: 1000.0,
                               attackPower: 140.0)
        let game = GameViewModel(yourMon: mon, enemy: enemymon)
        
        ContentView(game: game)
    }
}
#endif
