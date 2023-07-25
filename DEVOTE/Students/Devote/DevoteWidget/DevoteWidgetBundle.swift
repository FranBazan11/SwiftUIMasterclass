//
//  DevoteWidgetBundle.swift
//  DevoteWidget
//
//  Created by Juan Bazan Carrizo on 18/07/2023.
//

import WidgetKit
import SwiftUI

@main
struct DevoteWidgetBundle: WidgetBundle {
    var body: some Widget {
        DevoteWidget()
        DevoteWidgetLiveActivity()
    }
}
