//
//  isBlank.swift
//  TodoBySwiftUI
//
//  Created by Jiehao Zhang on 2020/2/3.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

extension String {
    var isBlank:Bool {
        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedStr.isEmpty
    }
}
