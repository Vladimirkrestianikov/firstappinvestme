import SwiftUI

struct Note: Identifiable, Codable, Equatable {
    let id: UUID
    var text: String
    var date: Date
    
    init(id: UUID = UUID(), text: String, date: Date = Date()) {
        self.id = id
        self.text = text
        self.date = date
    }
}

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    private let fileName = "notes.json"
    
    init() {
        loadNotes()
    }
    
    private func getFileURL() -> URL? {
        do {
            let url = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            )
            return url.appendingPathComponent(fileName)
        } catch {
            print("Ошибка при получении пути к файлу: \(error)")
            return nil
        }
    }
    
    private func saveNotes() {
        guard let fileURL = getFileURL() else { return }
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to: fileURL)
        } catch {
            print("Ошибка сохранения заметок: \(error)")
        }
    }
    
    private func loadNotes() {
        guard let fileURL = getFileURL(),
              FileManager.default.fileExists(atPath: fileURL.path) else {
            self.notes = []
            return
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoded = try JSONDecoder().decode([Note].self, from: data)
            self.notes = decoded
        } catch {
            print("Ошибка загрузки заметок: \(error)")
            self.notes = []
        }
    }
    
    func addNote(text: String) {
        let newNote = Note(text: text)
        notes.append(newNote)
        saveNotes()
    }
    
    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        saveNotes()
    }
    
    func updateNote(note: Note, newText: String) {
        if let index = notes.firstIndex(of: note) {
            notes[index].text = newText
            notes[index].date = Date()
            saveNotes()
        }
    }
}

struct NotesPage: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var newNoteText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.notes.isEmpty {
                    Spacer()
                    Text("Нет заметок")
                        .foregroundColor(.gray)
                        .font(.headline)
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.notes) { note in
                            NavigationLink(destination: NoteEditor(note: note, viewModel: viewModel)) {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(note.text)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .lineLimit(2)
                                    
                                    Text(note.date.formatted(date: .abbreviated, time: .shortened))
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.blue.opacity(0.15), Color.purple.opacity(0.15)]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                                )
                                .shadow(color: Color.black.opacity(0.05), radius: 3, x: 2, y: 3)
                            }
                        }
                        .onDelete(perform: viewModel.deleteNote)
                    }
                    .listStyle(.plain)
                }
                
                HStack {
                    TextField("Новая заметка...", text: $newNoteText)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.05), radius: 3, x: 1, y: 2)
                    
                    Button(action: {
                        if !newNoteText.isEmpty {
                            viewModel.addNote(text: newNoteText)
                            newNoteText = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                    }
                }
                .padding()
            }
            .navigationTitle("📒 Заметки")
        }
    }
}

struct NoteEditor: View {
    @State var note: Note
    @ObservedObject var viewModel: NotesViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextEditor(text: $note.text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue.opacity(0.4), lineWidth: 1)
                )
                .padding()
            
            Button(action: {
                viewModel.updateNote(note: note, newText: note.text)
                dismiss()
            }) {
                Text("💾 Сохранить")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 3)
            }
            .padding()
        }
        .navigationTitle("✏️ Редактирование")
    }
}

#Preview {
    NotesPage()
}
