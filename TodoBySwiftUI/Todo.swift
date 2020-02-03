//
//  todo.swift
//  TodoBySwiftUI
//
//  Created by Jiehao Zhang on 2020/1/30.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import Foundation

struct Todo:Identifiable {
    var id = UUID()
    var name: String
    var checked: Bool
    var important: Bool
    var isDeleted: Bool
}

var todos = [Todo]()
