//
//  JavaRoadmapPage.swift
//  investme
//
//  Created by Владимир Крестьяников on 08.09.2025.
//

import SwiftUI

struct JavaRoadmapPage: View {
    struct Concept: Identifiable {
        let id = UUID()
        let title: String
    }
    
    struct Category: Identifiable {
        let id = UUID()
        let name: String
        let items: [Concept]
    }
    
    // 📌 Категории для Java
    let categories: [Category] = [
        Category(
            name: "1. Основы Java",
            items: [
                Concept(title: "Переменные и константы (final)"),
                Concept(title: "Типы данных: int, double, char, String, boolean"),
                Concept(title: "Массивы и коллекции (Array, ArrayList, HashMap, HashSet)"),
                Concept(title: "Условные конструкции: if, else, switch"),
                Concept(title: "Циклы: for, while, do-while, for-each"),
                Concept(title: "Методы: параметры и возвращаемые значения"),
                Concept(title: "Область видимости (scope)"),
                Concept(title: "Исключения: try, catch, finally, throw")
            ]
        ),
        Category(
            name: "2. Основы ООП в Java",
            items: [
                Concept(title: "Классы и объекты"),
                Concept(title: "Свойства (fields) и методы"),
                Concept(title: "Конструкторы"),
                Concept(title: "Наследование (extends)"),
                Concept(title: "Интерфейсы (implements)"),
                Concept(title: "Абстрактные классы"),
                Concept(title: "Перечисления (enum)"),
                Concept(title: "Обобщения (generics)")
            ]
        ),
        Category(
            name: "3. Работа с памятью",
            items: [
                Concept(title: "JVM (Java Virtual Machine)"),
                Concept(title: "Garbage Collector"),
                Concept(title: "Сильные, слабые и фантомные ссылки"),
                Concept(title: "Утечки памяти и try-with-resources")
            ]
        ),
        Category(
            name: "4. Java UI и платформы",
            items: [
                Concept(title: "JavaFX (современный UI)"),
                Concept(title: "Swing (старый UI)"),
                Concept(title: "Android (через Java/Kotlin)"),
                Concept(title: "Spring Boot (для веб-приложений)"),
                Concept(title: "Maven / Gradle (сборка проектов)")
            ]
        ),
        Category(
            name: "5. Работа с данными",
            items: [
                Concept(title: "Файлы и потоки (File, InputStream, OutputStream)"),
                Concept(title: "JSON (Jackson, Gson)"),
                Concept(title: "JDBC (работа с базами)"),
                Concept(title: "Hibernate (ORM)"),
                Concept(title: "JPA (Java Persistence API)")
            ]
        ),
        Category(
            name: "6. Асинхронность и многопоточность",
            items: [
                Concept(title: "Threads (Runnable, Thread)"),
                Concept(title: "ExecutorService"),
                Concept(title: "Future и CompletableFuture"),
                Concept(title: "Stream API (параллельные потоки)")
            ]
        ),
        Category(
            name: "7. Сетевые запросы",
            items: [
                Concept(title: "HttpURLConnection"),
                Concept(title: "HttpClient (Java 11+)"),
                Concept(title: "REST API"),
                Concept(title: "WebSockets")
            ]
        ),
        Category(
            name: "8. Инструменты",
            items: [
                Concept(title: "IDE: IntelliJ IDEA, Eclipse, VS Code"),
                Concept(title: "Maven и Gradle"),
                Concept(title: "Git и GitHub"),
                Concept(title: "Unit-тесты (JUnit, TestNG)"),
                Concept(title: "Debugging, breakpoints")
            ]
        ),
        Category(
            name: "9. Архитектуры",
            items: [
                Concept(title: "MVC"),
                Concept(title: "MVVM (на Android)"),
                Concept(title: "Чистая архитектура"),
                Concept(title: "SOLID-принципы")
            ]
        ),
        Category(
            name: "10. Дополнительно",
            items: [
                Concept(title: "Spring Boot (для серверных приложений)"),
                Concept(title: "Microservices"),
                Concept(title: "Docker и контейнеризация"),
                Concept(title: "CI/CD (Jenkins, GitHub Actions)"),
                Concept(title: "Публикация приложений (Android, сервер)")
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
            .navigationTitle("Java Roadmap")
        }
    }
}

#Preview {
    JavaRoadmapPage()
}
