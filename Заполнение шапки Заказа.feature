﻿#language: ru
@ExportScenarios
@IgnoreOnCIMainBild
@tree

Функционал: экспорт сценариев

 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: заполнение шапки документа Заказ товара

	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Все для дома\""
	Когда открылось окно "Заказ (создание) *"
	И из выпадающего списка с именем 'Покупатель' я выбираю по строке "Магазин \"Продукты\""
	И из выпадающего списка с именем 'Склад' я выбираю по строке "Большой"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
