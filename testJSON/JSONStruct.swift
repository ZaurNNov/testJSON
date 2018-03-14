//
//  JSONStruct.swift
//  testJSON
//
//  Created by Zaur Giyasov on 30/01/2018.
//  Copyright © 2018 ZaurGiyasov. All rights reserved.
//

import Foundation

// "https://api.tinkoff.ru/v1/news"

struct News: Decodable {
//"resultCode":"OK",
//"trackingId":"58479826241"
//"payload":[]
    var resultCode: String = ""
    var trackingId: String = ""
    var payload: [Payloads] = []
}

struct Payloads: Decodable {
//    id: "10024",
//    name: "20122017-tinkoff-bank-x-mgu",
//    text: "Тинькофф Банк начинает сотрудничество с кафедрой математических и компьютерных методов анализа мехмата МГУ",
//    publicationDate: {
//    milliseconds: 1513767691000
//    },
//    bankInfoTypeId: 2
    var id: String = ""
    var name: String = ""
    var text: String = ""
    var publicationDate: DateInMilliseconds
    var bankInfoTypeId: Int = 0
}

struct DateInMilliseconds: Decodable {
//    milliseconds: 1513767691000
    var milliseconds: Double = 1
}

// All
/*
 {
 resultCode: "OK",
 payload: [
 {
 id: "10024",
 name: "20122017-tinkoff-bank-x-mgu",
 text: "Тинькофф Банк начинает сотрудничество с кафедрой математических и компьютерных методов анализа мехмата МГУ",
 publicationDate: {
 milliseconds: 1513767691000
 },
 bankInfoTypeId: 2
 },
 {
 id: "10004",
 name: "19122017-tinkoff-x-garmin-pay",
 text: "Тинькофф Банк запускает Garmin Pay",
 publicationDate: {
 milliseconds: 1513684913000
 },
 bankInfoTypeId: 2
 },
 {
 id: "9984",
 name: "15122017-tinkoff-bank-x-mir",
 text: "НСПК: клиенты Тинькофф Банка – самые активные пользователи карт «МИР»",
 publicationDate: {
 milliseconds: 1513332113000
 },
 bankInfoTypeId: 2
 },
 
 ***
 
 {
 id: "273",
 name: "message_change_tariff",
 text: "Сообщение об изменении тарифов",
 publicationDate: {
 milliseconds: 1225486800000
 },
 bankInfoTypeId: 2
 },
 {
 id: "271",
 name: "abonent_premium_cart",
 text: "Абонентам «Акадо» теперь доступна премиальная кредитная карта",
 publicationDate: {
 milliseconds: 1208808000000
 },
 bankInfoTypeId: 2
 }
 ],
 trackingId: "63569639127"
 }
 
 */




