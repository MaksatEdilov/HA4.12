//
//  Settings.swift
//  HA4.12
//
//  Created by Maksat Edil on 10/12/23.
//

import Foundation
enum Types {
    case none
    case configure
}

struct Settings {
    var title: String
    var type: Types
}
