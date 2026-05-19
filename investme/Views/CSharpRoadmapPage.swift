//
//  CSharpRoadmapPage.swift
//  investme
//
//  Created by Владимир Крестьяников on 08.09.2025.
//
import SwiftUI

struct CSharpRoadmapPage: View {
    struct Concept: Identifiable {
        let id = UUID()
        let title: String
    }
    
    struct Category: Identifiable {
        let id = UUID()
        let name: String
        let items: [Concept]
    }
    
    // 📌 Все категории
    let categories: [Category] = [
        Category(
            name: "1. Основы C#",
            items: [
                Concept(title: "Переменные и константы (var, const, readonly)"),
                Concept(title: "Типы данных: int, double, string, bool"),
                Concept(title: "Массивы и коллекции: Array, List, Dictionary"),
                Concept(title: "Условные конструкции: if, else, switch"),
                Concept(title: "Циклы: for, foreach, while, do-while"),
                Concept(title: "Методы: параметры и возвращаемые значения"),
                Concept(title: "Кортежи (tuples)"),
                Concept(title: "Nullable-типы (? и ??)"),
                Concept(title: "Область видимости (scope)"),
                Concept(title: "Исключения: try, catch, finally, throw")
            ]
        ),
        Category(
            name: "2. Основы ООП в C#",
            items: [
                Concept(title: "Классы и объекты"),
                Concept(title: "Свойства и методы"),
                Concept(title: "Конструкторы"),
                Concept(title: "Наследование"),
                Concept(title: "Интерфейсы"),
                Concept(title: "Абстрактные классы"),
                Concept(title: "Перечисления (enum)"),
                Concept(title: "Обобщения (generics)")
            ]
        ),
        Category(
            name: "3. Работа с памятью",
            items: [
                Concept(title: "CLR (Common Language Runtime)"),
                Concept(title: "GC (Garbage Collector)"),
                Concept(title: "Типы ссылок: strong, weak (через WeakReference)"),
                Concept(title: "Утечки памяти и IDisposable")
            ]
        ),
        Category(
            name: "4. Desktop UI",
            items: [
                Concept(title: "WinForms (старый UI)"),
                Concept(title: "WPF (Windows Presentation Foundation)"),
                Concept(title: "XAML"),
                Concept(title: "MVVM в WPF"),
                Concept(title: "MAUI (новый кроссплатформенный UI)")
            ]
        ),
        Category(
            name: "5. Web (ASP.NET)",
            items: [
                Concept(title: "ASP.NET Core"),
                Concept(title: "MVC"),
                Concept(title: "Razor Pages"),
                Concept(title: "Blazor"),
                Concept(title: "REST API")
            ]
        ),
        Category(
            name: "6. Работа с данными",
            items: [
                Concept(title: "Файлы и потоки (File, Stream)"),
                Concept(title: "JSON (System.Text.Json, Newtonsoft.Json)"),
                Concept(title: "Entity Framework Core"),
                Concept(title: "LINQ (Language Integrated Query)"),
                Concept(title: "ADO.NET (базово)")
            ]
        ),
        Category(
            name: "7. Асинхронность",
            items: [
                Concept(title: "async/await"),
                Concept(title: "Task и ValueTask"),
                Concept(title: "Parallel LINQ (PLINQ)"),
                Concept(title: "TPL (Task Parallel Library)")
            ]
        ),
        Category(
            name: "8. Сетевые запросы",
            items: [
                Concept(title: "HttpClient"),
                Concept(title: "REST API (GET/POST)"),
                Concept(title: "gRPC (базово)"),
                Concept(title: "WebSockets")
            ]
        ),
        Category(
            name: "9. Инструменты",
            items: [
                Concept(title: "Visual Studio / Rider"),
                Concept(title: "NuGet пакеты"),
                Concept(title: "Git и GitHub"),
                Concept(title: "Unit-тесты (xUnit, NUnit, MSTest)"),
                Concept(title: "Debugging, breakpoints")
            ]
        ),
        Category(
            name: "10. Архитектуры",
            items: [
                Concept(title: "MVC"),
                Concept(title: "MVVM"),
                Concept(title: "Чистая архитектура"),
                Concept(title: "SOLID-принципы")
            ]
        ),
        Category(
            name: "11. Дополнительно",
            items: [
                Concept(title: "Dependency Injection"),
                Concept(title: "gRPC и SignalR"),
                Concept(title: "Паттерны проектирования"),
                Concept(title: "Docker и контейнеризация"),
                Concept(title: "CI/CD (GitHub Actions, Azure DevOps)")
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
            .navigationTitle("C# Roadmap")
        }
    }
}

#Preview {
    CSharpRoadmapPage()
}

