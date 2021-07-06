//
//  NearestAirportsViewModel.swift
//  AirportFinder
//
//  Created by Avijit on 03/07/21.
//

import Foundation
import CoreLocation


protocol NearestAirportsViewModelType {
    var airportsArray: [AirportModel] { get set }
    var selectedCityModel: AirportModel { get set }
    
    func findNearestAirports(selectedCity: AirportModel) -> [AirportModel]
}

class NearestAirportsViewModel : NearestAirportsViewModelType {
    //-----------------------------------------------------------------------
    // MARK:- Properties
    //-----------------------------------------------------------------------
   var airportsArray: [AirportModel]
   var selectedCityModel: AirportModel
    
    //-----------------------------------------------------------------------
    // MARK:- Initializer
    //-----------------------------------------------------------------------
    init(selectedCityModel: AirportModel, airportArray : [AirportModel]) {
        self.selectedCityModel = selectedCityModel
        self.airportsArray = airportArray
    }
  
}
//-----------------------------------------------------------------------
// MARK:- Nearest Airport find
//-----------------------------------------------------------------------
extension NearestAirportsViewModel {

   public func findNearestAirports(selectedCity: AirportModel) -> [AirportModel] {
        
        let currentLat = selectedCity.lat?.toDouble() ?? 0.0
        let currentLong = selectedCity.lon?.toDouble() ?? 0.0
        let myLocation = CLLocation(latitude:currentLat, longitude: currentLong)
        
        return airportsArray.filter({  $0.type == "Airports"  }).sorted(by: { $0.distance(to: myLocation) < $1.distance(to: myLocation) })
    }

}
