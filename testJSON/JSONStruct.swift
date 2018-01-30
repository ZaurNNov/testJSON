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
    var resultCode: String
    var trackingId: Int
//    var playload: [String: String]
    
    init?(json: [String: AnyHashable]) {
        guard let resultCode = json["resultCode"] as? String,
              let trackingId = json["trackingId"] as? Int else { return nil }
        self.resultCode = resultCode
        self.trackingId = trackingId
    }
        
//        guard let playload = json["playload"] as? [String: String] else { return nil }
//        self.playload = playload
}

//struct News: Decodable {
//    //"resultCode":"OK",
//    //"trackingId":"58479826241"
//    //"payload":[]
//    let resultCode: String
//    let trackingId : Int
////    let payload: [String: String] = [:]
//}
//
//    struct payload: Decodable {
//        //    "id":"10024",
//        //    "name":"20122017-tinkoff-bank-x-mgu",
//        //    "text":"Тинькофф Банк начинает сотрудничество с кафедрой математических и компьютерных методов анализа мехмата МГУ",
//        //    "publicationDate":{
//        //    "milliseconds":1513767691000
//        //    },
//        //    "bankInfoTypeId":2
//
//        let id: Int
//        let name: String
//        let text: String
//        let bankInfoTypeId: Int
//        let publicationDate: [publicationDate]
//    }
//    struct publicationDate: Decodable {
//        //    "publicationDate":{
//        //    "milliseconds":1513767691000
//        //    },
//        let milliseconds: Int
//    }

struct newsAPISerializer: JSONRepresentable {
    var resultCode: String
    var trackingId: Int
    var playload: [String: String]
    
    func makeJSON() throws -> JSON {
        var json = JSON([:])
        try json.set("resultCode", resultCode)
        try json.set("trackingId", trackingId)
        try json.set("playload", playload)
        return json
    }
}




