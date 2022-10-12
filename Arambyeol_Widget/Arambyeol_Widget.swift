//
//  Arambyeol_Widget.swift
//  Arambyeol_Widget
//
//  Created by 김가은 on 2022/10/10.
//

import WidgetKit
import SwiftUI

//위젯을 새로고침할 타임라인을 결정하고 생성하는 객체
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

struct Arambyeol_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
//
        Text(entry.date, style: .time)
//        Text("\(MENULIST[0])")
    }
}

@main
struct Arambyeol_Widget: Widget {
    //위젯을 식별하는 문자열
    let kind: String = "Arambyeol_Widget"

    var body: some WidgetConfiguration {
        // 클로저에는  widget을 렌더링하는 SwiftUI View 코드 입력
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Arambyeol_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Arambyeol") //위젯을 추가/편집 할 때 위젯에 표시되는 이름을 세팅하는 메소드
        .description("아람별 식단을 보여주는 위젯입니다.") //위젯을 추가/편집 할 때 위젯에 표시되는 설명 부분을 세팅하는 메소드
    }
}

struct Arambyeol_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Arambyeol_WidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
