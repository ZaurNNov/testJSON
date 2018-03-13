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

    var jname: String = "tinkoff-bank-x-mir"
    var jtext: String = "Тинькофф Банк вносит изменения в&nbsp;тарифы по&nbsp;кредитам на&nbsp;покупку"
    var milliseconds = Double(0000000000001)
    var id = Int(0)
    var bankInfoTypeId = Int(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        publicationDate.text = publicationDateInString(millisec: milliseconds)
        name.text = jname
        text.loadHTMLString(jtext.localizedUppercase, baseURL: nil)
    
    }
    
    

    
    func publicationDateInString(millisec: Double) -> String {
        let date = Date(timeIntervalSince1970:(millisec))
        let dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = dateFormat
        let printDate = dateFormatter.string(from: date)
        print(printDate)
        return printDate
    }
}
