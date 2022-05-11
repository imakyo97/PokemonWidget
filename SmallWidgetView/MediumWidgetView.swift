//
//  MediumWidgetView.swift
//  SmallWidgetViewExtension
//
//  Created by 今村京平 on 2022/05/11.
//

import WidgetKit
import SwiftUI
import Intents

struct MediumProvider: IntentTimelineProvider {
    func pokemons(for configuration: PokemonTypeIntent) -> [Pokemon] {
        switch configuration.PokemonType {
        case .unknown:
            return [.fusigidane, .fusigisou, .fusigibana]
        case .kusa:
            return [.fusigidane, .fusigisou, .fusigibana]
        case .honoo:
            return [.hitokage, .rizado, .rizadon]
        case .mizu:
            return [.zenigame, .kameru, .kamekkusu]
        }
    }

    func placeholder(in context: Context) -> MediumEntry {
        MediumEntry(date: Date(), configuration: PokemonTypeIntent(), pokemons: [.fusigidane, .fusigisou, .fusigibana])
    }

    func getSnapshot(for configuration: PokemonTypeIntent, in context: Context, completion: @escaping (MediumEntry) -> ()) {
        let entry = MediumEntry(date: Date(), configuration: configuration, pokemons: pokemons(for: configuration))
        completion(entry)
    }
    
    func getTimeline(for configuration: PokemonTypeIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [MediumEntry] = [MediumEntry(date: Date(), configuration: configuration, pokemons: pokemons(for: configuration))]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct MediumEntry: TimelineEntry {
    let date: Date
    let configuration: PokemonTypeIntent
    let pokemons: [Pokemon]
}

struct MediumWidgetEntryView : View {
    var entry: MediumProvider.Entry

    var body: some View {
        ZStack {
            Image("pokemonBackground")
                .resizable()
                .clipShape(ContainerRelativeShape())
            HStack {
                Spacer()
                Link(destination: entry.pokemons.first!.url) {
                    ZStack {
                        Image("pokemonBackground")
                            .resizable()
                            .clipShape(ContainerRelativeShape())
                        VStack(spacing: 10) {
                            Image(entry.pokemons.first!.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90)
                            Text(entry.pokemons.first!.name)
                                .font(.body)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .frame(width: 110, height: 110)
                }
                Link(destination: entry.pokemons[1].url) {
                    ZStack {
                        Image("pokemonBackground")
                            .resizable()
                            .clipShape(ContainerRelativeShape())
                        VStack(spacing: 10) {
                            Image(entry.pokemons[1].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90)
                            Text(entry.pokemons[1].name)
                                .font(.body)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .frame(width: 110, height: 110)
                }
                Link(destination: entry.pokemons.last!.url) {
                    ZStack {
                        Image("pokemonBackground")
                            .resizable()
                            .clipShape(ContainerRelativeShape())
                        VStack(spacing: 10) {
                            Image(entry.pokemons.last!.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90)
                            Text(entry.pokemons.last!.name)
                                .font(.body)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .frame(width: 110, height: 110)
                }
                Spacer()
            }
        }
    }
}

//@main
struct MediumWidget: Widget {
    let kind: String = "MediumWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PokemonTypeIntent.self, provider: MediumProvider()) { entry in
            MediumWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Medium Widget")
        .description("This is a medium widget.")
        .supportedFamilies([.systemMedium]) // サポートするウィジェットサイズ
    }
}

struct MediumWidget_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetEntryView(entry: MediumEntry(date: Date(), configuration: PokemonTypeIntent(), pokemons: [.fusigidane, .fusigisou, .fusigibana]))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

// @mainは原則一つしか追加できない
// ContentViewとWidgetで一つ
@main
struct PokemonBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        SmallWidget()
        MediumWidget()
    }
}
