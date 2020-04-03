//
//  CountryInfoViewController.swift
//  RequestCoronaAPI
//
//  Created by gabriel on 02/04/20.
//  Copyright © 2020 gabriel. All rights reserved.
//

import UIKit

class CountryInfoViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    
    var country: String
    
    init?(coder: NSCoder, country: String) {
        self.country = country
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a user.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabels()
    }
    
    func updateLabels() {
        Requests.getCountryCases(country: country, completionHandler: { (countryCases) in
            
            self.countryLabel.text = countryCases.country
            self.confirmedLabel.text = String(countryCases.cases)
            self.recoveredLabel.text = String(countryCases.recovered)
            self.deathsLabel.text = String(countryCases.deaths)
                        
            let date = Date(timeIntervalSince1970: (countryCases.updated/1000))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            dateFormatter.timeZone = TimeZone(abbreviation: "BRT")
            let lastUpdate = dateFormatter.string(from: date)
            
            self.lastUpdateLabel.text = "Last update: \(lastUpdate)"
        })
    }
}

