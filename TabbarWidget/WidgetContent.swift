//
//  WidgetContent.swift
//  CustomTabbar
//
//  Created by nhatle on 7/24/20.
//

import Foundation
import WidgetKit

struct WidgetContent: TimelineEntry, Decodable {
    var date = Date()
    let name: String
    let cardViewSubtitle: String
    let descriptionPlainText: String
    let releasedAtDateTimeString: String
}
