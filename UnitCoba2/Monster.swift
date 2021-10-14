//
//  Monster.swift
//  UnitCoba2
//
//  Created by Haryanto Salim on 05/10/21.
//

import Foundation

protocol BattleAble{
    func attack(mon: Monster, with type: AttackType)
}

class GameViewModel: ObservableObject{
    @Published var mon: Monster
    @Published var enemymon: Monster
    
    init(yourMon: Monster, enemy: Monster){
        self.mon = yourMon
        self.enemymon = enemy
    }
    
    func battle() {
        if mon.signAttack == .rock && enemymon.signAttack == .scissor {
            enemymon.life -= mon.attackPower
        } else if mon.signAttack == .rock && enemymon.signAttack == .paper {
            mon.life -= enemymon.attackPower
        } else if mon.signAttack == .paper && enemymon.signAttack == .rock {
            enemymon.life -= mon.attackPower
        } else if mon.signAttack == .paper && enemymon.signAttack == .scissor {
            mon.life -= enemymon.attackPower
        } else if mon.signAttack == .scissor && enemymon.signAttack == .paper {
            enemymon.life -= mon.attackPower
        } else if mon.signAttack == .scissor && enemymon.signAttack == .rock {
            mon.life -= enemymon.attackPower
        }
    }
}

enum AttackType: CaseIterable{
    case rock
    case paper
    case scissor
}

struct Monster: BattleAble {
    func attack(mon: Monster, with type: AttackType) {
        print("\(self.name) is attacking \(mon.name) with \(type) while \(mon.name) is defending with \(mon.signAttack!)")
    }
    
    var name: String
    var emoji: String
    var life: Float
    var attackPower: Float
    
    var signAttack: AttackType?
    
    init(name: String, emoji: String, life: Float, attackPower: Float){
        self.name = name
        self.emoji = emoji
        self.life = life
        self.attackPower = attackPower
    }
}