//
//  SmallWidgetView.swift
//  SmallWidgetView
//
//  Created by 今村京平 on 2022/05/10.
//

import WidgetKit
import SwiftUI
import Intents

struct SmallProvider: IntentTimelineProvider {
    func pokemon(for configuration: MyPokemonIntent) -> Pokemon {
        switch configuration.MyPokemon {
        case .unknown:
            return .fusigidane
        case .fusigidane:
            return .fusigidane
        case .fusigisou:
            return .fusigisou
        case .fusigibana:
            return .fusigibana
        case .hitokage:
            return .hitokage
        case .rizado:
            return .rizado
        case .rizadon:
            return .rizadon
        case .zenigame:
            return .zenigame
        case .kameru:
            return .kameru
        case .kamekkusu:
            return .kamekkusu
        }
    }

    func placeholder(in context: Context) -> SmallEntry {
        SmallEntry(date: Date(), configuration: MyPokemonIntent(), pokemon: Pokemon.fusigidane)
    }

    func getSnapshot(for configuration: MyPokemonIntent, in context: Context, completion: @escaping (SmallEntry) -> ()) {
        let entry = SmallEntry(date: Date(), configuration: configuration, pokemon: Pokemon.fusigidane)
        completion(entry)
    }

    func getTimeline(for configuration: MyPokemonIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SmallEntry] = [SmallEntry(date: Date(), configuration: configuration, pokemon: pokemon(for: configuration))]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SmallEntry: TimelineEntry {
    let date: Date
    let configuration: MyPokemonIntent
    let pokemon: Pokemon
}

struct SmallWidgetEntryView : View {
    var entry: SmallProvider.Entry

    var body: some View {
        ZStack {
            Image("pokemonBackground")
                .resizable()
            VStack(spacing: 10) {
                Image(entry.pokemon.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90)
                Text(entry.pokemon.name)
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .widgetURL(entry.pokemon.url)
    }
}

//@main
struct SmallWidget: Widget {
    let kind: String = "SmallWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: MyPokemonIntent.self, provider: SmallProvider()) { entry in
            SmallWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Small Widget")
        .description("This is a small widget.")
        .supportedFamilies([.systemSmall]) // サポートするウィジェットサイズ
    }
}

struct SmallWidget_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetEntryView(entry: SmallEntry(date: Date(), configuration: MyPokemonIntent(), pokemon: Pokemon.fusigidane))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
