import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    let dataEncodeKey: String = "item_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard 
            let data = UserDefaults.standard.data(forKey: dataEncodeKey),
            let dataDecode = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        items.self = dataDecode
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func move(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(item: ItemModel) {
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem() {
        if let dataEncode = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(dataEncode, forKey: dataEncodeKey)
        }
    }
    
}
