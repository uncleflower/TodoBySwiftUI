//
//  DeleteTodo.swift
//  TodoBySwiftUI
//
//  Created by Jiehao Zhang on 2020/2/3.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct DeleteTodo: View {
    
    @EnvironmentObject var userData: UserData
    @State private var showAlert = false
    
    
    var body: some View {
        List {
            ForEach(userData.userTodos) { todo in
                if todo.isDeleted {
                    HStack {
                        Button(action:{
                            let todoIndex = self.userData.userTodos.firstIndex(where: {$0.id == todo.id})!
                            self.userData.userTodos[todoIndex].isDeleted = false
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                        }
                        .animation(.default)
                        TodoCell(todo: todo)
                        
                    }
                }
            }
        }
        .navigationBarTitle(Text("回收站"))
        .navigationBarItems(trailing:
            Button(action:{
                self.showAlert = true
            }){
                Text("清除回收站")
                    .foregroundColor(.red)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("你确定要清空回收站吗？"),
                      message: Text("任务将无法恢复"),
                      primaryButton: .destructive(Text("确定")) {
                        for todo in self.userData.userTodos {
                            if todo.isDeleted {
                                let todoIndex = self.userData.userTodos.firstIndex(where: {$0.id == todo.id})!
                                self.userData.userTodos.remove(at: todoIndex)
                            }
                        }
                },
                      secondaryButton: .cancel(Text("取消")))
            }
        )
    }
}



struct DeleteTodo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Group {
                DeleteTodo().environment(\.colorScheme, .dark)
                DeleteTodo()
            }
            .environmentObject(UserData())
        }
    }
}
