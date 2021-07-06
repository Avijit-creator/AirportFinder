//
//  AirportModel.swift
//  AirportFinder
//
//  Created by Avijit on 02/07/21.
//

import Foundation
import Alamofire
import CoreLocation

// MARK: - AirportModel
struct AirportModel: Codable {
    var code, lat, lon, name: String?
    var city, state, country, woeid: String?
    var tz, phone, type, email: String?
    var url, runwayLength, elev, icao: String?
    var directFlights, carriers: String?

    enum CodingKeys: String, CodingKey {
        case code, lat, lon, name, city, state, country, woeid, tz, phone, type, email, url
        case runwayLength = "runway_length"
        case elev, icao
        case directFlights = "direct_flights"
        case carriers
    }
    
    //-----------------------------------------------------------------------
    // MARK:- Location variable
    //-----------------------------------------------------------------------

   public var location: CLLocation {
        return CLLocation(latitude: (lat?.toDouble() ?? 0.0) as CLLocationDegrees, longitude: (lon?.toDouble() ?? 0.0) as CLLocationDegrees)
       }
    
    
    //-----------------------------------------------------------------------
    // MARK:- Distance Calculation based on current location
    //-----------------------------------------------------------------------
    public func distance(to location: CLLocation) -> CLLocationDistance {
           return location.distance(from: self.location)
       }
    
}
