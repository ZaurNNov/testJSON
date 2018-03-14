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
    var payload: [JPayloads]
    
    init(resultCode: String, trackingId: String, payload: [JPayloads]) {
        //default init struct
        self.resultCode = resultCode
        self.trackingId = trackingId
        self.payload = payload
    }
}

extension JNews: Decodable {
    enum MyStructKeys: String, CodingKey {
        // declaring our keys
        case resultCode = "resultCode"
        case trackingId = "trackingId"
        case payload = "payload"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self) // defining our (keyed) container
        let resultCode: String = try container.decode(String.self, forKey: .resultCode) // extracting the data
        let trackingId: String = try container.decode(String.self, forKey: .trackingId) // extracting the data
        let payload: [JPayloads] = try container.decode([JPayloads].self, forKey: .payload)
        
        self.init(resultCode: resultCode, trackingId: trackingId, payload: payload) // initializing our struct
    }
}

struct JPayloads {
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
    var publicationDate: JDateInMilliseconds
    var bankInfoTypeId: Int
    
    init(id: String, name: String, text: String, bankInfoTypeId: Int, publicationDate: JDateInMilliseconds) {
        self.id = id
        self.name = name
        self.text = text
        self.publicationDate = publicationDate
        self.bankInfoTypeId = bankInfoTypeId
    }
}

extension JPayloads: Decodable {
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
        let publicationDate: JDateInMilliseconds = try container.decode(JDateInMilliseconds.self, forKey: .publicationDate)
        
        self.init(id: id, name: name, text: text, bankInfoTypeId: bankInfoTypeId, publicationDate: publicationDate) // initializing our struct
    }
}

struct JDateInMilliseconds {
    //    milliseconds: 1513767691000
    var milliseconds: Double
    
    init(milliseconds: Double) {
        self.milliseconds = milliseconds
    }
}

extension JDateInMilliseconds: Decodable {
    enum MyStructKeys: String, CodingKey {
        case milliseconds = "milliseconds"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self)
        let milliseconds: Double = try container.decode(Double.self, forKey: .milliseconds)
        
        self.init(milliseconds: milliseconds)
    }
}

