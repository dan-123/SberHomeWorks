# SberHomeWorks

**Отличия Trunk-based development от feature-подхода**

**Подход Trunk-Based Development в разработке:**

В основе лежит модель ветвления, в которой разработчики совместно работают над кодом в одной ветке, называемой «главной» (или master в терминологии Git), при этом второстепенные feature-ветки также могут создаваться, но они имеют короткий срок жизни.

Этот подход позволяет разработчикам избежать сложностей связанных со слиянием веток. Словосочетание «главная ветка» (от англ. “trunk” - ствол) несет в себе идею растущего дерева, у которого самой толстой и самой длинной частью является именно ствол, а не ветви, которые расходятся от него и имеют более ограниченную длину.

**Основные особенности:**

1. Ветки живут максимум 2 дня.
2. Feature Flags - концепция в которой есть файл конфигурации, где прописано какая из фич включена/выключена и в коде существует проверка которая позволяет пропускать определенную логику.
3. Branch By Abstraction - создание ветки на изменение одной абстракции, вместо создание ветки для фич.
4. Continuous Code Review - концепция при которой код попадающий на ревью, должен ревьювится как можно быстрее.
5. Master всегда готов к деплою, даже если в нем есть не готовые фичи.

**Минусы:**

1. Лучше всего подходит для команды из опытных разработчиков.
2. Наполовину готовые функции, неправильно реализованными feature flag'ами, могут вызвать проблемы.
3. Изначально может вызвать некоторые проблемы, если нет хорошего покрытия тестами или уверенности в стабильности системы.

**Модель ветвления Feature Branch Workflow:**

В отличии от Trunk-Based Development подхода основная идея модели Feature Branch Workflow заключается в том, что вся работа над новой функциональностью должна производится в отдельной ветке, а не в ветке master. Такая инкапсуляция облегчает работу нескольких разработчиков над общей функциональностью в рамках одной кодовой базы, также это значит, что нерабочий код никогда не попадет в ветку master.

Изоляция работы над новой функциональностью также позволяет эффективно использовать запросы на объединение кода (pull request, merge request), которые являются способом инициализации обсуждения изменений, созданных в ветке. Они дают другим разработчикам возможность одобрить функциональность перед интегрирацией в официальный проект.

**Основные особенности:**

1. Ориентирована на шаблоны ветвления - работа над новой функциональностью должна производится в отдельной ветке.
2. Хорошо подходит для "традиционной модели релизов", где релизы делаются раз в месяц или раз в пару недель.
3. Может быть использована вместе с другими моделями работы с репозиториями.
4. Способствует общению в команде посредством запросов на объединение и ревью кода.

**Минусы:**

1. Может замедлять работу, когда приходится ревьювить большие пулл реквесты.
2. Релизы сложно делать чаще, чем раз в неделю.
3. Большие функции могут потратить дни на мерж и резолв конфликтов и форсировать несколько циклов тестирования.
4. История проекта в гите имеет много merge commits и затрудняет просмотр реальной работы.
5. Может быть проблематичным в CI/CD сценариях.
