//
//  ViewController.swift
//  testJSON
//
//  Created by Zaur Giyasov on 30/01/2018.
//  Copyright © 2018 ZaurGiyasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let jsonUrl = "https://api.tinkoff.ru/v1/news"

    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var logLabel: UILabel!
    
    @IBAction func getAction(_ sender: UIButton) {
        getFunc()
        
    }
    
    @IBAction func postAction(_ sender: UIButton) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getFunc()

    }
    
    func getFunc() {
        print("** Get **")
        guard let url = URL(string: jsonUrl) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            do {
                //let news = try JSONSerialization.jsonObject(with: data, options: [])
                //print(news)
                
                let new = try JSONDecoder().decode([News].self, from: data)
                print("\(new)")
                
                
            } catch {
                print("*** Some wrong! + \(error)")
            }
            
        })
        task.resume()
    }
    

}

