//
//  ViewController.swift
//  covid_19
//
//  Created by manavarthivenkat on 23/05/20.
//  Copyright © 2020 manavarthivenkat. All rights reserved.
//

import UIKit

class IndiaWiseViewController: UIViewController , Covid19DataManagerDelegate {
   
    
    @IBOutlet weak var confirmed: UILabel!
    
    @IBOutlet weak var recovered: UILabel!
    
    @IBOutlet weak var active: UILabel!
   
    @IBOutlet weak var deaths: UILabel!
    
    var dataManager = DataManager()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchData()
    }
    
    func didUpdateUIAfterFetchingDataSuccesful(with stateWiseData : StatesData) {
        let totalItem = stateWiseData.statewise[0]
        confirmed.text = totalItem.confirmed
        recovered.text = totalItem.recovered
        active.text = totalItem.active
        deaths.text = totalItem.deaths
   }
}

