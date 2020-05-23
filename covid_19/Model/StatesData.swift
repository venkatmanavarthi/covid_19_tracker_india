//
//  StateData.swift
//  covid_19
//
//  Created by manavarthivenkat on 23/05/20.
//  Copyright © 2020 manavarthivenkat. All rights reserved.
//

import Foundation
struct StatesData : Decodable {
    let statewise : [SingleStateData]
}
struct SingleStateData : Decodable {
    let active : String
    let confirmed : String
    let state : String
    let deaths : String
    let recovered : String
    let lastupdatedtime : String
}
