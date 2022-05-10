//
//  Pokemon.swift
//  PokemonWidget
//
//  Created by 今村京平 on 2022/05/10.
//

import Foundation
import UIKit

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let url: URL
}

extension Pokemon {
    static let fusigidane = Pokemon(name: "フジギダネ", imageName: "Fusigidane", url: URL(string: "pokemon://fusigidane")!)
    static let fusigisou = Pokemon(name: "フシギソウ", imageName: "Fusigisou", url: URL(string: "pokemon://fusigisou")!)
    static let fusigibana = Pokemon(name: "フシギバナ", imageName: "Fusigibana", url: URL(string: "pokemon://fusigibana")!)
    static let hitokage = Pokemon(name: "ヒトカゲ", imageName: "Hitokage", url: URL(string: "pokemon://hitokage")!)
    static let rizado = Pokemon(name: "リザード",   imageName: "Riza-do", url: URL(string: "pokemon://rizado")!)
    static let rizadon = Pokemon(name: "リザードン", imageName: "Riza-don", url: URL(string: "pokemon://rizadon")!)
    static let zenigame = Pokemon(name: "ゼニガメ", imageName: "Zenigame", url: URL(string: "pokemon://zenigame")!)
    static let kameru = Pokemon(name: "カメール", imageName: "Kame-ru", url: URL(string: "pokemon://kameru")!)
    static let kamekkusu = Pokemon(name: "カメックス", imageName: "Kamekkusu", url: URL(string: "pokemon://kamekkusu")!)
}
