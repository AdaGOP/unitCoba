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
                HStack{
                    AttackButton(attackType: .rock, action: {
                        print("attack with rock")
                        game.enemymon.signAttack = .rock
                        game.mon.signAttack = AttackType.allCases.randomElement()
                        game.battle()
                        game.enemymon.attack(mon: game.mon, with: .rock)
                    })
                    AttackButton(attackType: .paper, action: {
                        print("attack with paper")
                        game.enemymon.signAttack = .paper
                        game.mon.signAttack = AttackType.allCases.randomElement()
                        game.battle()
                        game.enemymon.attack(mon: game.mon, with: .paper)
                    })
                    AttackButton(attackType: .scissor, action: {
                        print("attack with scissor")
                        game.enemymon.signAttack = .scissor
                        game.mon.signAttack = AttackType.allCases.randomElement()
                        game.battle()
                        game.enemymon.attack(mon: game.mon, with: .scissor)
                    })
                }
                Spacer()
                VStack {
                    MonsterView(mon: $game.enemymon)
                    MonsterView(mon: $game.mon)
                }.padding(.all, 8)
                Spacer()
                HStack {
                    AttackButton(attackType: .rock, action: {
                            print("Attack with Rock")
                            game.mon.signAttack = .rock
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .rock)
                    })
                    AttackButton(attackType: .paper, action: {
                            print("Attack with Paper")
                            game.mon.signAttack = .paper
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .paper)
                    })
                    AttackButton(attackType: .scissor, action: {
                            print("Attack with Scissor")
                            game.mon.signAttack = .scissor
                            game.enemymon.signAttack = AttackType.allCases.randomElement()
                            game.battle()
                            game.mon.attack(mon: game.enemymon, with: .scissor)
                    })
                }
                Spacer()
            }.navigationTitle("Fight")
        }
    }
}

struct AttackButton: View {
    var attackType: AttackType
    var action: () -> Void
    var body: some View {
        if #available(iOS 15.0, *) {
            Button(action: action){
                Text("\(GameService.translate(attackType).icon)")
                    .font(
                        .system(
                            size: 44))
            }.buttonStyle(.borderedProminent)
        } else {
            // Fallback on earlier versions
            Button(action: action) {
                Text("\(GameService.translate(attackType).icon)")
                    .font(
                        .system(
                            size: 44))
            }
        }
    }
}

struct MonsterView: View {
    @Binding var mon: Monster
    var body: some View {
        HStack {
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
            }
            if let currAttack = mon.signAttack {
                Text("\(GameService.translate(currAttack).icon)")
                    .font(
                        .system(
                            size: 44))
            }
        }.padding(.all, 8)
            .cornerRadius(10)
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
