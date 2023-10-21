import SwiftUI

struct AddItemView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var textFieldText: String = ""
    @State var saveButtonisDisable: Bool = true
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(5)
                    .padding()
                    .onChange(of: textFieldText, initial: true) {
                        validateTextField()
                    }
                Button("SAVE") {
                    saveButtonPressed()
                }
                .disabled(saveButtonisDisable)
                .foregroundStyle(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(saveButtonisDisable ? Color.gray : Color.blue)
                .cornerRadius(5)
                .padding(14)
            }
        }
        .navigationTitle("Add New Item 📜")
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldText)
        dismiss()
    }
    
    func validateTextField() {
        withAnimation(.easeInOut) {
            saveButtonisDisable = textFieldText.count <= 3
        }
    }
}

#Preview {
    NavigationStack {
        AddItemView()
    }
    .environmentObject(ListViewModel())
}
