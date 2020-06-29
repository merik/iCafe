//
//  HomeViewRouter.swift
//  iCafe
//
//  Created by Erik Mai on 29/6/20.
//  Copyright © 2020 Erik Mai. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum HomeTabView {
    case menu
    case order
}

class HomeViewRouter: ObservableObject {
    @Published var currentView: HomeTabView = .menu
}
