//
//  TabbarWidget.swift
//  TabbarWidget
//
//  Created by nhatle on 7/24/20.
//

import WidgetKit
import SwiftUI
import Intents

let snapshotEntry = WidgetContent(
  name: "iOS Concurrency with GCD and Operations",
  cardViewSubtitle: "iOS & Swift",
  descriptionPlainText: """
    Learn how to add concurrency to your apps! \
    Keep your app's UI responsive to give your \
    users a great user experience.
    """,
  releasedAtDateTimeString: "Jun 23 2020 • Video Course (3 hrs, 21 mins)")

struct Provider: IntentTimelineProvider {
    public typealias Entry = WidgetContent

    func readContents() -> [Entry] {
      var contents: [WidgetContent] = []
      let archiveURL =
        FileManager.sharedContainerURL()
          .appendingPathComponent("contents.json")
      print(">>> \(archiveURL)")

      let decoder = JSONDecoder()
      if let codeData = try? Data(contentsOf: archiveURL) {
        do {
          contents = try decoder.decode([WidgetContent].self, from: codeData)
        } catch {
          print("Error: Can't decode contents")
        }
      }
      return contents
    }

//    public func snapshot(with context: Context, completion: @escaping (WidgetContent) -> ()) {
    public func snapshot(
      for configuration: TimelineIntervalIntent,
      with context: Context,
      completion: @escaping (Entry) -> Void
    ) {
        let entry = snapshotEntry
        completion(entry)
    }

//    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    public func timeline(
      for configuration: TimelineIntervalIntent,
      with context: Context,
      completion: @escaping (Timeline<Entry>) -> Void
    ) {
//        var entries: [WidgetContent] = []
        var entries = readContents()

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = WidgetContent(date: entryDate)
//            entries.append(entry)
//        }

        let currentDate = Date()
        let interval = configuration.interval as! Int
        for index in 0 ..< entries.count {
          entries[index].date = Calendar.current.date(byAdding: .second,
            value: index * interval, to: currentDate)!
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct PlaceholderView : View {
    var body: some View {
        EntryView(model: snapshotEntry)//.redacted(reason: .placeholder)
    }
}

struct TabbarWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

@main
struct TabbarWidget: Widget {
//    private let kind: String = "TabbarWidget"
//
//    public var body: some WidgetConfiguration {
//        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
//            TabbarWidgetEntryView(entry: entry)
//        }
//        .configurationDisplayName("My Widget")
//        .description("This is an example widget.")
//    }
    private let kind: String = "TabbarWidget"

    public var body: some WidgetConfiguration {
//      StaticConfiguration(
//        kind: kind,
//        provider: Provider(),
//        placeholder: PlaceholderView()
//      ) { entry in
        IntentConfiguration(
            kind: kind,
            intent: TimelineIntervalIntent.self,
            provider: Provider(),
            placeholder: PlaceholderView()
        ) { entry in
            EntryView(model: entry)
        }
      .configurationDisplayName("RW Tutorials")
      .description("See the latest video tutorials.")
    }
}

//struct TabbarWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        TabbarWidgetEntryView(entry: WidgetContent(date: Date()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
