//
//  ViewController.swift
//  CurrencyApiApp
//
//  Created by YASIN AKCA on 18.04.2020.
//  Copyright © 2020 YASIN AKCA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var afnLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var kwdLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ratesClicked(_ sender: Any) {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=eb82d18fa624016e198aade2196c0ec4&format=1")
        let session = URLSession.shared
        let data = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "An error occured while fetching the data", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                if data != nil {
                    let response = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary <String, Any>
                    DispatchQueue.main.async {
                        DispatchQueue.main.async {
                            if let rates = response?["rates"] as? [String : Any] {
                                
                                if let afn = rates["AFN"] as? Double {
                                    self.afnLabel.text = "AFN: \(afn)"
                                }
                                
                                if let kwd = rates["KWD"] as? Double {
                                    self.kwdLabel.text = "KWD: \(kwd)"
                                }
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                
                                if let tryy = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(tryy)"
                                }
                            }
                        }
                    }
                }
            }
        }
        data.resume()
    }
    
}

