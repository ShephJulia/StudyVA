#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: подготовка данных
	когда экспорт основных данных
	//добавлю соглашение без организации
	И я проверяю или создаю для справочника "Agreements" объекты:
		| 'Ref'                                                                | 'DeletionMark' | 'Code' | 'Number' | 'Date'               | 'PartnerSegment' | 'Partner'                                                          | 'Company' | 'PriceType'                                                          | 'ItemSegment' | 'StartUsing'         | 'EndOfUse'           | 'ManagerSegment' | 'PriceIncludeTax' | 'DaysBeforeDelivery' | 'Store' | 'Type'                         | 'LegalName'                                                         | 'CurrencyMovementType'                                                                            | 'ApArPostingDetail'                   | 'StandardAgreement' | 'Kind'                        | 'UseCreditLimit' | 'CreditLimitAmount' | 'PaymentTerm' | 'Description_en' | 'Description_hash' | 'Description_ru'             | 'Description_tr' |
		| 'e1cib/data/Catalog.Agreements?ref=b458708bcd53fee711f01b65d01cbd2d' | 'False'        | 10     | ''       | '01.01.0001 0:00:00' | ''               | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794c' | ''        | 'e1cib/data/Catalog.PriceTypes?ref=b762b13668d0905011eb76684b9f6866' | ''            | '01.01.0001 0:00:00' | '01.01.0001 0:00:00' | ''               | 'True'            |                      | ''      | 'Enum.AgreementTypes.Customer' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7674324a4a2c' | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 'Enum.ApArPostingDetail.ByAgreements' | ''                  | 'Enum.AgreementKinds.Regular' | 'False'          |                     | ''            | ''               | ''                 | 'Соглашение без организации' | ''               |

Сценарий: заполнение Организации по условию
* создание заказа покупателю
	Дано Я открываю навигационную ссылку 'e1cib/list/Document.SalesOrder' 
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно "Заказ покупателя (создание)"
* начальное заполнение
	И из выпадающего списка с именем 'Partner' я выбираю по строке "Клиент 2"
	И я перехожу к следующему реквизиту
	И из выпадающего списка с именем 'Agreement' я выбираю по строке "Соглашение без организации"
	И я перехожу к следующему реквизиту
* выбор организации с условием	
	Если элемент формы с именем 'Company' равен "" тогда
		И я нажимаю кнопку выбора у поля с именем 'Company'
		И в таблице 'List' я перехожу к строке:
			| "Наименование"           |
			| "Собственная компания 1" |
		И я нажимаю на кнопку с именем 'FormChoose'
	И поле с именем 'Company' заполнено
	И я закрываю все окна клиентского приложения
	

				
		


		