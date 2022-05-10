//
//  ContentView.swift
//  PokemonWidget
//
//  Created by 今村京平 on 2022/05/10.
//

import SwiftUI

struct ContentView: View {

    @State var fusigidaneActive: Bool = false
    @State var fusigisouActive: Bool = false
    @State var fusigibanaActive: Bool = false
    @State var hitokageActive: Bool = false
    @State var rizadoActive: Bool = false
    @State var rizadonActive: Bool = false
    @State var zenigameActive: Bool = false
    @State var kameruActive: Bool = false
    @State var kamekkusuActive: Bool = false

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PokemonView(pokemon: .fusigidane), isActive: $fusigidaneActive) {
                    PokemonRow(pokemon: .fusigidane)
                }
                NavigationLink(destination: PokemonView(pokemon: .fusigisou), isActive: $fusigisouActive) {
                    PokemonRow(pokemon: .fusigisou)
                }
                NavigationLink(destination: PokemonView(pokemon: .fusigibana), isActive: $fusigibanaActive) {
                    PokemonRow(pokemon: .fusigibana)
                }
                NavigationLink(destination: PokemonView(pokemon: .hitokage), isActive: $hitokageActive) {
                    PokemonRow(pokemon: .hitokage)
                }
                NavigationLink(destination: PokemonView(pokemon: .rizado), isActive: $rizadoActive) {
                    PokemonRow(pokemon: .rizado)
                }
                NavigationLink(destination: PokemonView(pokemon: .rizadon), isActive: $rizadonActive) {
                    PokemonRow(pokemon: .rizadon)
                }
                NavigationLink(destination: PokemonView(pokemon: .zenigame), isActive: $zenigameActive) {
                    PokemonRow(pokemon: .zenigame)
                }
                NavigationLink(destination: PokemonView(pokemon: .kameru), isActive: $kameruActive) {
                    PokemonRow(pokemon: .kameru)
                }
                NavigationLink(destination: PokemonView(pokemon: .kamekkusu), isActive: $kamekkusuActive) {
                    PokemonRow(pokemon: .kamekkusu)
                }
                .navigationTitle("ポケモン")
            }
            .onOpenURL { url in
                fusigidaneActive = url == Pokemon.fusigidane.url
                fusigisouActive = url == Pokemon.fusigisou.url
                fusigibanaActive = url == Pokemon.fusigibana.url
                hitokageActive = url == Pokemon.hitokage.url
                rizadoActive = url == Pokemon.rizado.url
                rizadonActive = url == Pokemon.rizadon.url
                zenigameActive = url == Pokemon.zenigame.url
                kameruActive = url == Pokemon.kameru.url
                kamekkusuActive = url == Pokemon.kamekkusu.url
            }
        }
    }
}

struct PokemonRow: View {
    let pokemon: Pokemon
    var body: some View {
        HStack {
            Image(pokemon.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
            Text(pokemon.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
