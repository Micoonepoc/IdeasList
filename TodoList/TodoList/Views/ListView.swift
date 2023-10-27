import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                EmptyListView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture(count: 2) {
                                withAnimation(.spring()) {
                                    listViewModel.updateItem(item: item)
                                    HapticManager.shared.notification(type: .success)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.move)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Todo List💻")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddItemView())
            }
        })
    }

}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}


