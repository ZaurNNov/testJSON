//
//  BodyNewsViewController.swift
//  testJSON
//
//  Created by Zaur Giyasov on 14/03/2018.
//  Copyright © 2018 ZaurGiyasov. All rights reserved.
//

import UIKit

class BodyNewsViewController: UIViewController {

    @IBOutlet weak var BodyTitle: UILabel!
    @IBOutlet weak var BodySecondTitle: UILabel!
    @IBOutlet weak var BodyNewsText: UILabel!
    
    let jsonDummyBodyNews = "https://api.tinkoff.ru/v1/news_content?id="
    var id = ""
    var url: String = (self.jsonDummyBodyNews + self.id)

    let jsonTestNews = "https://api.tinkoff.ru/v1/news_content?id=2143"
    
    var bodyPayload = BodyPayloads()
    var bodyNews = BodyNews()
    
    func getData(compleated: @escaping () -> ()) {
        print("** Get Body **")
        guard let url = URL(string: jsonTestNews) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            do {
                self.bodyNews = try JSONDecoder().decode(BodyNews.self, from: data)
                
                print ("bodyNews.resultCode: " + (self.bodyNews.resultCode))
                print ("bodyNews.trackingId: " + (self.bodyNews.trackingId))
                print ("bodyNews.payload: ", (self.bodyNews.payload) as Any)
                DispatchQueue.main.async {
                    compleated()
                }
                
            } catch {
                print("*** Some wrong! + \(error)")
            }
        })
        task.resume()
    }
    
    func inputData() {
        getData {
            print("JSON body news parse complete")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputData()
        
        if let structur = bodyPayload {
            BodyTitle.text = structur.title.text
            BodySecondTitle.text = "LastModificationDate: " + publicationDateInString(millisec: structur.lastModificationDate.lastModificationDate.milliseconds)
            BodyNewsText.text = structur.content
            
        }
    }

    

}
