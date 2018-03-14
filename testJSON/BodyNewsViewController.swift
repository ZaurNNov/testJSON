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
//    @IBOutlet weak var BodyNewsText: UILabel!
    @IBOutlet weak var BodyNewsText: UIWebView!
    
    var id: String?

    private let newsDetailUrl = "https://api.tinkoff.ru/v1/news_content?id="
    
    private var bodyNews: BodyNews?
    
    private func getData(compleated: @escaping () -> ()) {
        print("** Get Body **")
        guard let id = id,
            let url = URL(string: newsDetailUrl + id) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode(BodyNews.self, from: data)
                
                print ("bodyNews.resultCode: " + (news.resultCode))
                print ("bodyNews.trackingId: " + (news.trackingId))
                print ("bodyNews.payload: ", (news.payload) as Any)
                DispatchQueue.main.async {
                    self.bodyNews = news
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
            if let content = self.bodyNews?.payload {
                self.BodyNewsText.loadHTMLString(content.content, baseURL: nil)
                self.BodyTitle.text = prepareNameString(string: content.title.text)
                self.BodySecondTitle.text = publicationDateInString(millisec: content.lastModificationDate.milliseconds)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputData()

    }
}
