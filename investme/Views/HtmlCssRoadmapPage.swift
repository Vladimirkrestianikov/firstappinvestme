//
//  HtmlCssRoadmapPage.swift
//  investme
//
//  Created by Владимир Крестьяников on 08.09.2025.
//

import SwiftUI

struct HtmlCssRoadmapPage: View {
    struct Concept: Identifiable {
        let id = UUID()
        let title: String
    }
    
    struct Category: Identifiable {
        let id = UUID()
        let name: String
        let items: [Concept]
    }
    
    // 📌 Категории для HTML & CSS
    let categories: [Category] = [
        Category(
            name: "1. Основы HTML",
            items: [
                Concept(title: "Структура документа (<!DOCTYPE>, <html>, <head>, <body>)"),
                Concept(title: "Заголовки и текст (h1–h6, p, span, strong, em)"),
                Concept(title: "Ссылки (<a href>)"),
                Concept(title: "Изображения (<img src>)"),
                Concept(title: "Списки (ul, ol, li)"),
                Concept(title: "Таблицы (table, tr, td, th)"),
                Concept(title: "Формы (input, textarea, button, select)"),
                Concept(title: "Атрибуты (id, class, title, alt)")
            ]
        ),
        Category(
            name: "2. Основы CSS",
            items: [
                Concept(title: "Селекторы (элемент, класс, id, вложенность)"),
                Concept(title: "Свойства текста (color, font-size, font-family)"),
                Concept(title: "Фон (background-color, background-image)"),
                Concept(title: "Границы и отступы (margin, padding, border)"),
                Concept(title: "Размеры (width, height, max-width)"),
                Concept(title: "Позиционирование (static, relative, absolute, fixed, sticky)"),
                Concept(title: "Flexbox (display: flex, justify-content, align-items)"),
                Concept(title: "Grid (display: grid, grid-template-columns)")
            ]
        ),
        Category(
            name: "3. HTML5",
            items: [
                Concept(title: "Семантические теги (header, footer, article, section, nav)"),
                Concept(title: "Мультимедиа (audio, video)"),
                Concept(title: "Canvas и SVG"),
                Concept(title: "Form API (новые input типы: email, date, number)")
            ]
        ),
        Category(
            name: "4. Современный CSS",
            items: [
                Concept(title: "Переменные (var(--color))"),
                Concept(title: "Псевдоклассы (:hover, :nth-child, :focus)"),
                Concept(title: "Псевдоэлементы (::before, ::after)"),
                Concept(title: "Анимации (transition, @keyframes)"),
                Concept(title: "Медиа-запросы (@media для адаптива)"),
                Concept(title: "CSS Grid (layout)"),
                Concept(title: "Custom Fonts (@font-face, Google Fonts)")
            ]
        ),
        Category(
            name: "5. Практика и интеграция",
            items: [
                Concept(title: "HTML + CSS связка (<link rel=\"stylesheet\">)"),
                Concept(title: "Адаптивная верстка (responsive design)"),
                Concept(title: "Мобильная оптимизация (viewport meta)"),
                Concept(title: "SEO основы (meta description, alt у картинок)"),
                Concept(title: "Доступность (ARIA атрибуты)"),
                Concept(title: "CSS фреймворки (Bootstrap, Tailwind)")
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
            .navigationTitle("HTML & CSS Roadmap")
        }
    }
}

#Preview {
    HtmlCssRoadmapPage()
}
