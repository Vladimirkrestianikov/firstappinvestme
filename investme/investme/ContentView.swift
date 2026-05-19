import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("Avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.mint, lineWidth: 3))
                    .shadow(radius: 13)
                
                Text("Welcome to INVESTME")
                    .font(.title)
                    .padding(.top)
                
                // Первая кнопка
                NavigationLink(destination: SwiftBasicsPage()) {
                    Text("Основы языка swift")
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                // Вторая кнопка
                NavigationLink(destination: CSharpRoadmapPage()) {
                    Text("Основы языка С#")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                // Третья кнопка
                NavigationLink(destination: JavaRoadmapPage()) {
                    Text("Основы языка java")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                // Четвертая кнопка
                NavigationLink(destination: HtmlCssRoadmapPage()) {
                    Text("Основы языка Html and css")
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.orange]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                //  Пятая кнопка — заметки
                NavigationLink(destination: NotesPage()) {
                    Text("Мои заметки")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                Spacer()
                
                Text("INVESTME")
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
