//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by 이조은 on 11/25/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

    //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct WeatherWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("서울")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                Image(systemName: "location.fill")
                    .resizable()
                    .frame(width: 9, height: 9)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white)
                Spacer()
            }
            Text("25°")
                .font(.system(size: 45))
                .fontWeight(.light)
                .foregroundStyle(.white)

            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 19, height: 19)
                .symbolRenderingMode(.multicolor)
                .padding(.top, 8)
            Text("Sunny")
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .padding(.top, 3)
            Text("H:31°, L:25°")
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .padding(.top, 2)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WeatherWidgetEntryView(entry: entry)
                .containerBackground(LinearGradient(colors: [Color(red: 0.04, green: 0.3, blue: 0.57), Color(red: 0.32, green: 0.58, blue: 0.84)], startPoint: .top, endPoint: .bottom), for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }

    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    WeatherWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
