//
//  CountrySelectViewController.swift
//  RequestCoronaAPI
//
//  Created by gabriel on 02/04/20.
//  Copyright © 2020 gabriel. All rights reserved.
//

import UIKit

class CountrySelectViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let countries = ["Brazil", "USA", "Italy", "Spain", "Germany", "China"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func confirmCountry(_ sender: Any) {
        let selectedCountry = countries[pickerView.selectedRow(inComponent: 0)]
        guard let vc = storyboard?.instantiateViewController(identifier: "CountryInfo", creator: { coder in
            return CountryInfoViewController(coder: coder, country: selectedCountry)
        }) else {
            fatalError("Failed to load ViewController from storyboard.")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CountrySelectViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
}
