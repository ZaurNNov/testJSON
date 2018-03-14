//
//  NewsTableViewController.swift
//  testJSON
//
//  Created by Zaur Giyasov on 13/03/2018.
//  Copyright © 2018 ZaurGiyasov. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let jsonUrl = "https://api.tinkoff.ru/v1/news"
    let jsonDummyBodyNews = "https://api.tinkoff.ru/v1/news_content?id="
    
    var data = News()
    var bodyPayload = BodyPayloads()

    func getData(compleated: @escaping () -> ()) {
        print("** Get **")
        guard let url = URL(string: jsonUrl) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            do {
                self.data = try JSONDecoder().decode(News.self, from: data)
                
                print ("news.resultCode: " + (self.data.resultCode))
                print ("news.trackingId: " + (self.data.trackingId))
                print ("news.payload.count: ", (self.data.payload.count) as Any)
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
            print("JSON parse complete")
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.payload.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = prepareNameString(string: data.payload[indexPath.row].text)
        cell.detailTextLabel?.text = publicationDateInString(millisec: data.payload[indexPath.row].publicationDate.milliseconds)

        return cell
    }
    

    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? BodyNewsViewController, segue.identifier == "Description" {
            if let index = self.tableView.indexPathForSelectedRow?.row {
                vc.id = self.data.payload[index].id
                
            }
            
            
//            vc.payload = self.data.payload[(self.tableView.indexPathForSelectedRow?.row)!]
//            if let index = self.tableView.indexPathForSelectedRow?.row {
//                vc.payload = data.payload[index]
//            }
        }
    }
}

//extension NSAttributedString {
//    internal convenience init?(html: String) {
//        guard let data = html.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
//            return nil
//        }
//        guard let attributedString = try? NSMutableAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil) else {
//            return nil
//        }
//        self.init(attributedString: attributedString)
//    }
//}

func publicationDateInString(millisec: Double) -> String {
    let date = Date(timeIntervalSince1970:(millisec/1000))
    let dateFormatter = DateFormatter.init()
    dateFormatter.dateStyle = .medium
    let printDate = dateFormatter.string(from: date)
    print(printDate)
    return printDate
}

func prepareNameString(string: String) -> String {
    let A_String = string.replacingOccurrences(of: "&amp;", with: "", options: .literal, range: nil)
    let B_String = A_String.replacingOccurrences(of: "laquo;", with: "", options: .literal, range: nil)
    let C_String = B_String.replacingOccurrences(of: "raquo;", with: "", options: .literal, range: nil)
    let D_String = C_String.replacingOccurrences(of: "&nbsp;", with: " ", options: .literal, range: nil)
    let F_String = D_String.replacingOccurrences(of: "<nobr>", with: "", options: .literal, range: nil)
    let G_String = F_String.replacingOccurrences(of: "</nobr>", with: "", options: .literal, range: nil)
    
    return G_String
}
