//
//  DataManager.swift
//  covid_19
//
//  Created by manavarthivenkat on 23/05/20.
//  Copyright © 2020 manavarthivenkat. All rights reserved.
//

import UIKit

protocol Covid19DataManagerDelegate {
    func didUpdateUIAfterFetchingDataSuccesful(with stateWiseData : StatesData)
}

struct DataManager {
    
    var delegate : Covid19DataManagerDelegate?
    
    let url : String = "https://api.covid19india.org/data.json"
    func fetchData(){
        loadData(with: url)
    }
    func loadData(with url : String){
        if let url = URL(string: url){
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if let _ = error{
                    print("error")
                    return
                }
                if let data = data{
                    if let statesData = self.parseJSON(with : data){
                        DispatchQueue.main.async {
                            self.delegate?.didUpdateUIAfterFetchingDataSuccesful(with: statesData)
                        }
                    }
                }
            }
            dataTask.resume()
        }
    }
    func parseJSON(with data : Data) -> StatesData?{
        let decoder = JSONDecoder()
        do{
            let statesData = try decoder.decode(StatesData.self, from: data)
            return statesData
        }catch{
            print(error)
            return nil
        }
    }
        
}
