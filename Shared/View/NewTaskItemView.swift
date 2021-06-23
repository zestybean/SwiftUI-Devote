//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Brando Lugo on 6/23/21.
//

import SwiftUI

struct NewTaskItemView: View {
    //MARK: - PROPS
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    //MARK: - FUNCS
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .center, spacing: 16, content: {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                Button(action: {
                    addItem()
                }, label: {
                    Spacer()
                    Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ?  Color.blue : Color.pink)
                .cornerRadius(10)
            })//VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }//VSTACK
        .padding()
    }
}

//MARK: - PREV
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray)
            .edgesIgnoringSafeArea(.all)
    }
}
