import SwiftUI

struct EmptyListView: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Your list is empty!")
                    .font(.title)
                    .bold()
                Text("Create your own unique list, add anything you can think of with a simple click of a button.")
                    .font(.headline)
                    .padding()
                NavigationLink {
                    AddItemView()
                } label: {
                    Text("Add your best ideas💡")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(isAnimated ? Color.pink : Color.purple)
                        .cornerRadius(10)
                }
                .padding(.horizontal, isAnimated ? 30 : 50)
                .shadow(color: isAnimated ? Color.pink : Color.purple,
                        radius: isAnimated ? 20: 10,
                        x: 0,
                        y: isAnimated ? 50 : 30)
                .scaleEffect(isAnimated ? 1.2 : 1.0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: startAnimation)
        }
    }
    
    func startAnimation() {
        guard !isAnimated else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                isAnimated.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        EmptyListView()
            .navigationTitle("Title")
    }
}
