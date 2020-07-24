//
//  ViewRouter.swift
//  CustomTabbar
//
//  Created by nhatle on 7/24/20.
//

import SwiftUI
import Combine

enum TabbarView {
    case home
    case setting
    case camera
    case photo
}

class ViewRouter: ObservableObject {
    @Published var currentView: TabbarView = .home
}
