//
//  ListRowView.swift
//  TodoList
//
//  Created by Михаил on 16.10.2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel

    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
    }
}



#Preview {
     let item1 = ItemModel(title: "First item", isCompleted: false)
    return ListRowView(item: item1)
}

#Preview {
    let item2 = ItemModel(title: "Second item", isCompleted: true)
    return ListRowView(item: item2)
}
