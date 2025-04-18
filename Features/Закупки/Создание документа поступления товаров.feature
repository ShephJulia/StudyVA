﻿#language: ru

@tree

Функционал: <первый урок>
тут просто что-то написано 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа поступления товаров
//создание документа поступления
* Открытие формы создания документа
	И В командном интерфейсе я выбираю "Закупки" "Поступления товаров"
	Тогда открылось окно "Поступления товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Поступление товара (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Все для дома\""
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
	И я нажимаю кнопку выбора у поля с именем 'Поставщик'
	Тогда открылось окно "Контрагенты"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000012" | "Мосхлеб ОАО"  |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Поступление товара (создание) *"
* Заполнение табличной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000011" | "Продукты"     |
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000032" | "Торт "        |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Поступление товара (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10,00"
	И я перехожу к следующему реквизиту
	И в таблице 'Товары' я завершаю редактирование строки
* проверка заполнения ТЧ
	Тогда таблица 'Товары' стала равной:
		| 'N' | 'Товар' | 'Артикул' | 'Цена'   | 'Количество' | 'Сумма'    |
		| '1' | 'Торт ' | 'Т78'     | '150,00' | '15,00'      | '1 500,00' |
	
	
		
* Прповедение и закрытие
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Поступление товара (создание) *" в течение 20 секунд


Сценарий: проверка элемента Торт
И В командном интерфейсе я выбираю "Закупки" "Товары"
Тогда открылось окно "Товары"
И в таблице 'Список' я перехожу к строке:
	| "Код"       | "Наименование" |
	| "000000011" | "Продукты"     |
И в таблице 'Список' я перехожу на один уровень вниз
И в таблице 'Список' я перехожу к строке:
	| "Артикул" | "Код"       | "Наименование" | "Поставщик"   |
	| "Т78"     | "000000032" | "Торт "        | "Мосхлеб ОАО" |
