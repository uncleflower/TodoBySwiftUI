//
//  TodoCell.swift
//  TodoBySwiftUI
//
//  Created by Jiehao Zhang on 2020/1/30.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI



struct TodoCell: View {
    
    var todo: Todo
    var body: some View {
        HStack {
            Text(todo.name)
            Spacer()
            
            //important
            if todo.important {
                    Image(systemName:"star.fill")
                        .foregroundColor(.yellow)
                }else{
                    Image(systemName:"star")
                        .foregroundColor(.secondary)
                }
            
            //Checked
            if todo.checked {
                    Image(systemName:"checkmark.circle.fill")
                        .foregroundColor(.yellow)
                }else{
                    Image(systemName:"checkmark.circle")
                        .foregroundColor(.secondary)
                }
            
            
        }
    }
}

struct TodoCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoCell(todo: todos[0])
            TodoCell(todo: todos[1])
            TodoCell(todo: todos[2])
        }
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
