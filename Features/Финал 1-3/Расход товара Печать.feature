﻿#language: ru
@Печать
@Продажи
@tree

Функционал: проверка печати Расхода товаров

Как менеджер по продажам я хочу распечатать документ 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: подготовка данных
* загрузка данных
	когда загрузка константы и организация
	когда загрузка склады
	когда загрузка поставщик
	когда загрузка покупатель
	когда загрузка Товары
	когда загрузка прихода товара
	когда загрузка продажи товара

Сценарий: проверка печатной формы Расхода товаров
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=b459708bcd53fee711f020e676be0916"
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Дано Табличный документ "SpreadsheetDocument" равен макету "МакетПечатиРасходаТоваровНЕДЕМО" по шаблону
	И я закрываю все окна клиентского приложения
			
	