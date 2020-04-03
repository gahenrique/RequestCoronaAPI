//
//  CountryCases.swift
//  RequestCoronaAPI
//
//  Created by gabriel on 02/04/20.
//  Copyright © 2020 gabriel. All rights reserved.
//

struct CountryCases: Codable {
    let country: String
    let cases: Int
    let deaths: Int
    let recovered: Int
    let countryInfo: Flag
    let updated: Double
}

struct Flag: Codable {
    let flag: String
}
