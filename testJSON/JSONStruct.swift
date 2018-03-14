//
//  JSONStruct.swift
//  testJSON
//
//  Created by Zaur Giyasov on 30/01/2018.
//  Copyright © 2018 ZaurGiyasov. All rights reserved.
//

import Foundation

struct News: Decodable {
//"resultCode":"OK",
//"trackingId":"58479826241"
//"payload":[]
    var resultCode: String = ""
    var trackingId: String = ""
    var payload: [Payloads] = []
    
//    init?(json: [String: AnyHashable]) {
//        guard
//            let resultCode = json["resultCode"] as? String,
//            let trackingId = json["trackingId"] as? String,
//            let payload = json["payload"] as? [Payloads] else { return nil }
//        self.resultCode = resultCode
//        self.trackingId = trackingId
//        self.payload = payload
//    }
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
    
//    init?(json: [String: AnyHashable]) {
//        guard
//            let id = json["id"] as? String,
//            let name = json["name"] as? String,
//            let text = json["text"] as? String,
//            let bankInfoTypeId = json["bankInfoTypeId"] as? Int,
//            let publicationDate = json["publicationDate"] as? DateInMilliseconds else { return nil }
//
//        self.id = id
//        self.name = name
//        self.text = text
//        self.bankInfoTypeId = bankInfoTypeId
//        self.publicationDate = publicationDate
//    }
}

struct DateInMilliseconds: Decodable {
//    milliseconds: 1513767691000
    var milliseconds: Double
    
//    init?(json: [String: AnyHashable]) {
//        guard
//            let milliseconds = json["milliseconds"] as? Double else { return nil }
//
//        self.milliseconds = milliseconds
//    }
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




