//
//  UserData.swift
//  TodoBySwiftUI
//
//  Created by Jiehao Zhang on 2020/1/30.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    
    @Published var userTodos = todos
}
