//
//  StateWiseViewController.swift
//  covid_19
//
//  Created by manavarthivenkat on 24/05/20.
//  Copyright © 2020 manavarthivenkat. All rights reserved.
//

import UIKit

class StateWiseViewController: UIViewController , Covid19DataManagerDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    var dataManager = DataManager()
    var SingleStateData : [SingleStateData]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "StateCell", bundle: nil), forCellReuseIdentifier: "StateCellReuse")
        tableView.dataSource = self
        dataManager.delegate = self
        tableView.rowHeight = 100
        dataManager.fetchData()
    }
    func didUpdateUIAfterFetchingDataSuccesful(with stateWiseData: StatesData) {
        SingleStateData = stateWiseData.statewise
        tableView.reloadData()
    }
      

}
extension StateWiseViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = SingleStateData{
            return data.count
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCellReuse", for: indexPath) as! StateCell
        
        let item = SingleStateData?[indexPath.row]
        cell.stateLabel.text = item?.state
        cell.deaths.text = item?.deaths
        cell.activeLabel.text = item?.active
        cell.confirmedLabel.text = item?.confirmed
        cell.recoveredLabel.text = item?.recovered
            return cell
        
    }
    
    
}
