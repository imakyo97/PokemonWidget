//
//  PokemonView.swift
//  PokemonWidget
//
//  Created by 今村京平 on 2022/05/10.
//

import SwiftUI

struct PokemonView: View {
    let pokemon: Pokemon

    var body: some View {
        ZStack {
            Image("pokemonBackground")
                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(pokemon.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.top, .leading, .trailing], 60)
                Text(pokemon.name)
                    .foregroundColor(Color.white)
                    .font(.largeTitle.bold())
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.fusigidane)
    }
}
