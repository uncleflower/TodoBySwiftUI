//
//  TodoDetail.swift
//  TodoBySwiftUI
//
//  Created by Jiehao Zhang on 2020/1/30.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct TodoDetail: View {
    
    var todo: Todo
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userData: UserData
    var todoIndex: Int{
        userData.userTodos.firstIndex(where: {$0.id == todo.id})!
    }
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            HStack {
                TextField("", text: $userData.userTodos[todoIndex].name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //important
                Button(action: {
                    print("important")
                    self.userData.userTodos[self.todoIndex].important.toggle()
                }){
                    if userData.userTodos[todoIndex].important {
                        Image(systemName:"star.fill")
                        .foregroundColor(.yellow)
                    }else{
                        Image(systemName:"star")
                        .foregroundColor(.secondary)
                    }
                }
                    
                //checked
                Button(action: {
                    print("checked")
                    self.userData.userTodos[self.todoIndex].checked.toggle()
                }){
                    if userData.userTodos[todoIndex].checked {
                        Image(systemName:"checkmark.circle.fill")
                        .foregroundColor(.yellow)
                    }else{
                        Image(systemName:"checkmark.circle")
                        .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
            Button(action: {
                self.userData.userTodos[self.todoIndex].isDeleted = true
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("删除")
            }
            Spacer()
        }
        .navigationBarTitle(Text("编辑任务"),displayMode: .inline)
        
    }
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoDetail(todo: todos[0])
                .environmentObject(UserData())
        }
        
    }
}
