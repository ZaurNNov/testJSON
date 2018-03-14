//
//  DescriptionViewController.swift
//  testJSON
//
//  Created by Zaur Giyasov on 13/03/2018.
//  Copyright © 2018 ZaurGiyasov. All rights reserved.
//

import UIKit
import WebKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var publicationDate: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var text: WKWebView!
    
    var payload: Payloads?
    
    var jname: String = "07122017-tinkoff-x-insurance"
    var jtext: String = "Тинькофф Банк вносит изменения в&nbsp;тарифы по&nbsp;кредитам на&nbsp;покупку"
    var milliseconds = Double(0000000000001)
//    var id = Int(0)
//    var bankInfoTypeId = Int(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let structur = payload {
            name.text = QprepareNameString(string: structur.name)
            publicationDate.text = publicationDateInString(millisec: structur.publicationDate.milliseconds)
            text.loadHTMLString(structur.text, baseURL: nil)
        }
    }
    
    func QprepareNameString(string: String) -> String {
        let newString = string.replacingOccurrences(of: "-", with: " ", options: .numeric, range: nil)
        
        return newString
    }
    
    func publicationDateInString(millisec: Double) -> String {
        let date = Date(timeIntervalSince1970:(millisec/1000))
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateStyle = .medium
        let printDate = dateFormatter.string(from: date)
        print(printDate)
        return printDate
    }
}
