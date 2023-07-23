//
//  DevoteWidget.swift
//  DevoteWidget
//
//  Created by Juan Bazan Carrizo on 18/07/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DevoteWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        GeometryReader { geometryReader in
            ZStack {
                backgroundGradient
                Image("rocket-small")
                    .resizable()
                    .scaledToFit()
                Image("logo")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .offset(
                        x: (geometryReader.size.width / 2 - 18),
                        y: (geometryReader.size.height / -2) + 18)
                    .padding(.top, 25)
                    .padding(.trailing, 25)
                
                HStack {
                    Text("Just Do It")
                        .foregroundColor(.white)
                        .font(.system(.footnote, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 12)
                        .background(
                            Color.black.opacity(0.5).blendMode(.overlay))
                        .clipShape(Capsule())
                    if widgetFamily != .systemSmall {
                        Spacer()
                    }
                }
                .padding()
                .offset(y: (geometryReader.size.height / 2) - 24)
            }
        }
    }
}

struct DevoteWidget: Widget {
    let kind: String = "DevoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DevoteWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Devote Launcher")
        .description("This is an example widget Devote.")
    }
}

struct DevoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
