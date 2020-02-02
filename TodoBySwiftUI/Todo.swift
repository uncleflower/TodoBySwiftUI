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

var todos = [
    Todo(name: "炸学校", checked: true, important: false, isDeleted: false),
    Todo(name: "吃大象", checked: false, important: false, isDeleted: false),
    Todo(name: "开飞机", checked: false, important: true, isDeleted: false)
]
