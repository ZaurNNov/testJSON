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
    var data = News()

    func getData(compleated: @escaping () -> ()) {
        print("** Get **")
        guard let url = URL(string: jsonUrl) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            do {
                self.data = try JSONDecoder().decode(News.self, from: data)
                
                print ("jnew.resultCode: " + (self.data.resultCode))
                print ("jnew.trackingId: " + (self.data.trackingId))
                print ("jnew.payload.count: ", (self.data.payload.count) as Any)
                DispatchQueue.main.async {
                    compleated()
                }
                
            } catch {
                print("*** Some wrong! + \(error)")
            }
        })
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData {
            print("JSON parse complete")
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.payload.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = data.payload[indexPath.row].name
        cell.detailTextLabel?.text = String(describing: data.payload[indexPath.row].publicationDate)

        return cell
    }


    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? DescriptionViewController, segue.identifier == "Description" {
            vc.payload = self.data.payload[(self.tableView.indexPathForSelectedRow?.row)!]
            if let index = self.tableView.indexPathForSelectedRow?.row {
                vc.payload = data.payload[index]
            }
        }
    }
}
