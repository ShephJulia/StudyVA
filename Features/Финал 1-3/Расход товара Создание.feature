﻿#language: ru
@СозданиеДокументов
@Продажи
@tree

Функционал: проверка заполнения документа Продажа

Как менеджер по продажам я хочу быстро и правильно оформлять документ Расход товара

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 001_подготовка данных
* загрузка данных
	когда загрузка константы и организация
	когда загрузка склады
	когда загрузка поставщик
	когда загрузка покупатель
	когда загрузка Товары
	когда загрузка продажи товара
	когда загрузка цены товаров

Сценарий: заполнение документа
* заполнение шапки документа
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Товары\""
	И из выпадающего списка с именем 'Покупатель' я выбираю по строке "Попов Б.В. ИЧП"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Средний"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
* заполнение ТЧ документа
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "Туфли"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "Тапоч"
	И в таблице 'Товары' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я сохраняю навигационную ссылку текущего окна в переменную "СсылкаРасходТовара"
	И я закрываю текущее окно
* проверка формы после записи
	Дано Я открываю навигационную ссылку "$СсылкаРасходТовара$"
	Тогда элемент формы с именем 'Валюта' стал равен "Рубли"
	И элемент формы с именем 'ВидЦен' стал равен "Мелкооптовая"
	И элемент формы с именем 'Организация' стал равен "ООО \"Товары\""
	И элемент формы с именем 'Покупатель' стал равен "Попов Б.В. ИЧП "
	И элемент формы с именем 'Склад' стал равен "Средний"
	И таблица 'Товары' стала равной:
		| 'N' | 'Товар'   | 'Цена'     | 'Количество' | 'Сумма'    |
		| '1' | 'Туфли'   | '2 250,00' | '1,00'       | '2 250,00' |
		| '2' | 'Тапочки' | '700,00'   | '1,00'       | '700,00'   |
	И элемент формы с именем 'ТоварыИтогКоличество' стал равен "2"
	И элемент формы с именем 'ТоварыИтогСумма' стал равен "2 950"
	И я закрываю все окна клиентского приложения

Сценарий: видимость склада в зависимости от константы Учет по складам
* учет по складам отключен
	//И я перезаполняю константу "УчетПоСкладам" значением "Нет"
	Дано Я открываю навигационную ссылку "e1cib/command/ОбщаяКоманда.ОбщиеНастройки"
	И я снимаю флаг с именем 'УчетПоСкладам'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И элемент формы "Склад" отсутствует на форме
	И я закрываю текущее окно
* учет по складам включен	
	//И я перезаполняю константу "УчетПоСкладам" значением "Да"
	Дано Я открываю навигационную ссылку "e1cib/command/ОбщаяКоманда.ОбщиеНастройки"
	И я устанавливаю флаг с именем 'УчетПоСкладам'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"	
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И элемент формы "Склад" присутствует на форме
	И я закрываю все окна клиентского приложения

Сценарий: видимость валюты в зависимости от флага в Организации
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=b459708bcd53fee711f020e676be0916"
	И из выпадающего списка с именем 'Организация' я выбираю по строке 'ООО "Без валюты"'
	И элемент формы с именем "Валюта" отсутствует на форме
	И из выпадающего списка с именем 'Организация' я выбираю по строке 'ООО "Товары"'
	И элемент формы с именем "Валюта" присутствует на форме
	И Я закрываю текущее окно
	Тогда открылось окно "1С:Предприятие"
	И элемент формы с именем 'Message' стал равен 'Данные были изменены. Сохранить изменения?'
	И я нажимаю на кнопку с именем 'Button1'	
	И я закрываю все окна клиентского приложения

Сценарий: заполнение вида цены по покупателю
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=b459708bcd53fee711f020e676be0916"	
	И из выпадающего списка с именем 'Покупатель' я выбираю по строке "Шлюзовая"
	Тогда элемент формы с именем 'ВидЦен' стал равен "Оптовая"
	И из выпадающего списка с именем 'Покупатель' я выбираю по строке "Попов Б.В. ИЧП"
	Тогда элемент формы с именем 'ВидЦен' стал равен "Мелкооптовая"
	И Я закрываю текущее окно
	Тогда открылось окно "1С:Предприятие"
	И элемент формы с именем 'Message' стал равен 'Данные были изменены. Сохранить изменения?'	
	И я нажимаю на кнопку с именем 'Button1'
	И я закрываю все окна клиентского приложения

Сценарий: заполнение цены по виду цены
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=b459708bcd53fee711f020e676be0916"
	Тогда элемент формы с именем 'ВидЦен' стал равен "Мелкооптовая"
	Тогда таблица 'Товары' стала равной:
		| 'N' | 'Товар'   | 'Цена'     | 'Количество' | 'Сумма'    |
		| '1' | 'Тапочки' | '700,00'   | '1,00'       | '700,00'   |
		| '2' | 'Туфли'   | '2 250,00' | '1,00'       | '2 250,00' |

	И из выпадающего списка с именем 'ВидЦен' я выбираю точное значение "Оптовая"
	Тогда таблица 'Товары' стала равной:
		| 'N' | 'Товар'   | 'Цена'     | 'Количество' | 'Сумма'    |
		| '1' | 'Тапочки' | '600,00'   | '1,00'       | '600,00'   |
		| '2' | 'Туфли'   | '2 100,00' | '1,00'       | '2 100,00' |
	И Я закрываю текущее окно
	Тогда открылось окно "1С:Предприятие"
	И элемент формы с именем 'Message' стал равен 'Данные были изменены. Сохранить изменения?'
	И я нажимаю на кнопку с именем 'Button1'	
	И я закрываю все окна клиентского приложения	

Сценарий: про количество для услуги
// должно упасть, т.к. количество для услуги заполняется только после записи. а тест рассчитывает, что сразу
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=b459708bcd53fee711f020e676be0916"
	И элемент формы с именем 'ТоварыИтогКоличество' стал равен "2"
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю по строке "Доставка"
	И в таблице 'Товары' я завершаю редактирование строки
	Тогда таблица 'Товары' стала равной:
		| 'N' | 'Товар'    | 'Цена'     | 'Количество' | 'Сумма'    |
		| '1' | 'Тапочки'  | '700,00'   | '1,00'       | '700,00'   |
		| '2' | 'Туфли'    | '2 250,00' | '1,00'       | '2 250,00' |
		| '3' | 'Доставка' | '250,00'   | '1,00'       | '250,00'   |

	И элемент формы с именем 'ТоварыИтогКоличество' стал равен "3"
	И Я закрываю текущее окно
	Тогда открылось окно "1С:Предприятие"
	И элемент формы с именем 'Message' стал равен 'Данные были изменены. Сохранить изменения?'
	И я нажимаю на кнопку с именем 'Button1'	
	И я закрываю все окна клиентского приложения
		