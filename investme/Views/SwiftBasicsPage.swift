import SwiftUI

struct SwiftBasicsPage: View {
    struct Concept: Identifiable {
        let id = UUID()
        let title: String
    }
    
    struct Category: Identifiable {
        let id = UUID()
        let name: String
        let items: [Concept]
    }
    
    //  Все категории
    let categories: [Category] = [
        Category(
            name: "1. Основы программирования и Swift",
            items: [
                Concept(title: "Переменные и константы (var, let)"),
                Concept(title: "Типы данных: Int, Double, String, Bool"),
                Concept(title: "Коллекции: Array, Dictionary, Set"),
                Concept(title: "Условные конструкции: if, else, switch"),
                Concept(title: "Циклы: for in, while, repeat while"),
                Concept(title: "Функции: параметры и возвращаемые значения"),
                Concept(title: "Опционалы: ?, !, if let, guard let"),
                Concept(title: "Кортежи (tuples)"),
                Concept(title: "Замыкания (closures)"),
                Concept(title: "Область видимости (scope)"),
                Concept(title: "Работа с ошибками: try, catch, throw, do")
            ]
        ),
        Category(
            name: "2. Основы ООП в Swift",
            items: [
                Concept(title: "Структуры (struct) и классы (class)"),
                Concept(title: "Свойства и методы"),
                Concept(title: "Инициализаторы"),
                Concept(title: "Наследование"),
                Concept(title: "Протоколы (protocol)"),
                Concept(title: "Расширения (extension)"),
                Concept(title: "Перечисления (enum)"),
                Concept(title: "Обобщения (generics)")
            ]
        ),
        Category(
            name: "3. Работа с памятью",
            items: [
                Concept(title: "ARC (Automatic Reference Counting)"),
                Concept(title: "Сильные и слабые ссылки (strong, weak, unowned)"),
                Concept(title: "Циклы удержания (retain cycle) и их избегание")
            ]
        ),
        Category(
            name: "4. SwiftUI",
            items: [
                Concept(title: "View и модификаторы"),
                Concept(title: "VStack, HStack, ZStack"),
                Concept(title: "Текст, кнопки, изображения"),
                Concept(title: "NavigationStack, NavigationLink"),
                Concept(title: "TextField, Toggle, Slider"),
                Concept(title: "List, ForEach"),
                Concept(title: "Состояния: @State, @Binding, @ObservedObject"),
                Concept(title: "Анимации"),
                Concept(title: "Сетевые запросы в SwiftUI")
            ]
        ),
        Category(
            name: "5. UIKit",
            items: [
                Concept(title: "UIViewController"),
                Concept(title: "Storyboard, XIB, программный UI"),
                Concept(title: "Auto Layout (constraints)"),
                Concept(title: "TableView, CollectionView"),
                Concept(title: "UINavigationController, UITabBarController")
            ]
        ),
        Category(
            name: "6. Работа с данными",
            items: [
                Concept(title: "UserDefaults"),
                Concept(title: "Работа с файлами"),
                Concept(title: "Codable (JSON парсинг)"),
                Concept(title: "Core Data (базово)"),
                Concept(title: "Realm (альтернативная база)")
            ]
        ),
        Category(
            name: "7. Асинхронность",
            items: [
                Concept(title: "GCD (DispatchQueue)"),
                Concept(title: "async/await"),
                Concept(title: "Combine (реактивное программирование)")
            ]
        ),
        Category(
            name: "8. Сетевые запросы",
            items: [
                Concept(title: "URLSession"),
                Concept(title: "REST API"),
                Concept(title: "GET/POST запросы"),
                Concept(title: "JSON парсинг")
            ]
        ),
        Category(
            name: "9. Инструменты",
            items: [
                Concept(title: "Xcode: структура проекта, симулятор"),
                Concept(title: "Git и GitHub"),
                Concept(title: "Cocoapods / Swift Package Manager"),
                Concept(title: "Debugging, breakpoints"),
                Concept(title: "Unit-тесты (базово)")
            ]
        ),
        Category(
            name: "10. Архитектуры",
            items: [
                Concept(title: "MVC (базово)"),
                Concept(title: "MVVM (для SwiftUI)"),
                Concept(title: "SOLID-принципы (начальный уровень)")
            ]
        ),
        Category(
            name: "11. Дополнительно",
            items: [
                Concept(title: "Push-уведомления"),
                Concept(title: "MapKit (карты)"),
                Concept(title: "Локализация приложений"),
                Concept(title: "Human Interface Guidelines"),
                Concept(title: "Публикация в App Store")
            ]
        )
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    Section(header: Text(category.name).font(.headline)) {
                        ForEach(category.items) { item in
                            Text(item.title)
                                .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Swift Roadmap")
        }
    }
}

#Preview {
    SwiftBasicsPage()
}
