//
//  AddTodo.swift
//  TodoBySwiftUI
//
//  Created by Jiehao Zhang on 2020/2/3.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct AddTodo: View {
    
    @EnvironmentObject var userData: UserData
    @Binding var isPresented: Bool
    @State private var addTodo = Todo(name: "", checked: false, important: false,isDeleted: false)
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action:{
                    self.isPresented = false
                }) {
                    Text("取消")
                }
                Spacer()
                Button(action:{
                    if !self.addTodo.name.isBlank {
                        self.userData.userTodos.append(self.addTodo)
                    }
                    self.isPresented = false
                }) {
                    Text("确定")
                }
            }
            Spacer().frame(height: 30)
            HStack {
                TextField("添加任务", text: $addTodo.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                if addTodo.important {
                    Button(action:{
                        self.addTodo.important.toggle()
                    }) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }else{
                    Button(action:{
                        self.addTodo.important.toggle()
                    }) {
                        Image(systemName: "star")
                            .foregroundColor(.secondary)
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct AddTodo_Previews: PreviewProvider {
    static var previews: some View {
        AddTodo(isPresented: .constant(true))
        .environmentObject(UserData())
    }
}
