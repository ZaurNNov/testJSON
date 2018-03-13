//
//  Structurs.swift
//  testJSON
//
//  Created by Zaur Giyasov on 13/03/2018.
//  Copyright © 2018 ZaurGiyasov. All rights reserved.
//

import Foundation

struct JNews {
    //"resultCode":"OK",
    //"trackingId":"58479826241"
    //"payload":[]
    var resultCode: String
    var trackingId: String
    var playload: [AnyHashable]
    
    init(resultCode: String, trackingId: String, playload: [AnyHashable]) {
        //default init struct
        self.resultCode = resultCode
        self.trackingId = trackingId
        self.playload = playload
    }
}

extension JNews: Decodable {
    enum MyStructKeys: String, CodingKey {
        // declaring our keys
        case resultCode = "resultCode"
        case trackingId = "trackingId"
        case playload = "playload"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self) // defining our (keyed) container
        let resultCode: String = try container.decode(String.self, forKey: .resultCode) // extracting the data
        let trackingId: String = try container.decode(String.self, forKey: .trackingId) // extracting the data
        let playload: [AnyHashable] = try container.decode([AnyHashable].self, forKey: .playload)
        
        self.init(resultCode: resultCode, trackingId: trackingId, playload: playload) // initializing our struct
    }
}

struct JPlayloads {
    //    id: "10024",
    //    name: "20122017-tinkoff-bank-x-mgu",
    //    text: "Тинькофф Банк начинает сотрудничество с кафедрой математических и компьютерных методов анализа мехмата МГУ",
    //    publicationDate: {
    //    milliseconds: 1513767691000
    //    },
    //    bankInfoTypeId: 2
    var id: String
    var name: String
    var text: String
    var publicationDate: [AnyHashable]
    var bankInfoTypeId: Int
    
    init(id: String, name: String, text: String, bankInfoTypeId: Int, publicationDate: [AnyHashable]) {
        self.id = id
        self.name = name
        self.text = text
        self.publicationDate = publicationDate
        self.bankInfoTypeId = bankInfoTypeId
    }
}

extension JPlayloads: Decodable {
    enum MyStructKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case text = "text"
        case bankInfoTypeId = "bankInfoTypeId"
        case publicationDate = "publicationDate"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self)
        let id: String = try container.decode(String.self, forKey: .id)
        let name: String = try container.decode(String.self, forKey: .name)
        let text: String = try container.decode(String.self, forKey: .text)
        let bankInfoTypeId: Int = try container.decode(Int.self, forKey: .bankInfoTypeId)
        let publicationDate: [AnyHashable] = try container.decode([AnyHashable].self, forKey: .publicationDate)
        
        self.init(id: id, name: name, name: name, text: text, bankInfoTypeId: bankInfoTypeId, publicationDate: publicationDate) // initializing our struct
    }
}

//struct JDateInMilliseconds: Decodable {
//    //    milliseconds: 1513767691000
//    var milliseconds: Double
//
//    init?(json: [String: AnyHashable]) {
//        guard
//            let milliseconds = json["milliseconds"] as? Double else { return nil }
//
//        self.milliseconds = milliseconds
//    }
//}

