//
//  TodoList.swift
//  TodoBySwiftUI
//
//  Created by Jiehao Zhang on 2020/1/30.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct TodoList: View {
    
    @State private var showComplete = true
    @State private var showAdd = false
    @EnvironmentObject var userDate: UserData
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showComplete){
                    Text("显示已完成的任务")
                }
                
                ForEach(userDate.userTodos) { todo in
                    
                    if self.showComplete && !todo.isDeleted{
                        NavigationLink(
                            destination:TodoDetail(todo: todo).environmentObject(self.userDate)
                        ){
                            TodoCell(todo: todo)
                        }
                    }else{
                        if !todo.checked && !todo.isDeleted{
                            NavigationLink(
                                destination:TodoDetail(todo: todo).environmentObject(self.userDate)
                            ){
                                TodoCell(todo: todo)
                            }
                        }
                    }
                    
                    
                }
                
                NavigationLink(
                    destination: DeleteTodo().environmentObject(self.userDate
                    )){
                    Text("回收站")
                }
                
            }
            
            .navigationBarTitle(Text("任务清单"),displayMode: .large)
            .navigationBarItems(trailing:
            Button(action:{self.showAdd.toggle()}) {
                Image(systemName: "plus.square")
                    .font(.title)
                    .padding(.top)
                }
            )
                .sheet(
                    isPresented: $showAdd) {
                AddTodo(isPresented: self.$showAdd).environmentObject(self.userDate)
            }
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TodoList().environment(\.colorScheme, .dark)
            TodoList()
        }
        .environmentObject(UserData())
    }
}
