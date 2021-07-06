//
//  AppConstants.swift
//  AirportFinder
//
//  Created by Avijit on 02/07/21.
//

import Foundation


struct API {
    static let airport = "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json"
}

enum ViewModelCompletionType {
    case success(toastShouldShow: Bool, message: String, type: APIType)
    case error(toastShouldShow: Bool, message: String, type: APIType)
    case loader(loaderShouldShow: Bool, type: APIType)
}

typealias VMCompletion = (ViewModelCompletionType)->()

enum APIType {
    case fetchAirportData
}
