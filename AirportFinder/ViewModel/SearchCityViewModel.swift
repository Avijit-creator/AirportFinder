//
//  SearchCityViewModel.swift
//  AirportFinder
//
//  Created by Avijit on 02/07/21.
//

import Foundation
import UIKit
import CoreLocation

class SearchCityViewModel : NSObject {
    //-----------------------------------------------------------------------
    // MARK:- Public Properties
    //-----------------------------------------------------------------------
    public var cityArray : [AirportModel] = []
    public var arrayListJson: [AirportModel] = []
    public var searchResultArr: [AirportModel] = []
   
    public var searchCount : Int {
        return searchResultArr.count
    }
    public var completion: VMCompletion = {_ in}
    
    //-----------------------------------------------------------------------
    // MARK:- Search Index Result
    //-----------------------------------------------------------------------
   public func searchIndexData(index: Int) -> AirportModel {
        return searchResultArr[index]
    }
    
}
//-----------------------------------------------------------------------
// MARK:- API Call
//-----------------------------------------------------------------------
extension SearchCityViewModel {
   
   public func calledListingDetailApi(completion : @escaping(_ status : Bool)-> Void) {
        APIManager.shared.FetchApiDataMethod(parameter:[:]) { [weak self]  response in
            
            guard let weakSelf = self else { return }
            weakSelf.arrayListJson = response.compactMap{$0}
            weakSelf.cityArray = weakSelf.arrayListJson.uniques(by: \.city)

            if weakSelf.cityArray.count > 0 {
                completion(true)
            }
            
        }
    }
    
}
//-----------------------------------------------------------------------
// MARK:- Search Functionality
//-----------------------------------------------------------------------
extension SearchCityViewModel {
   public func searchListMethod (searchText : String, completion : @escaping (_ status : Bool) -> Void) {
        searchResultArr = cityArray.filter({ (text) -> Bool in
            let tmp  = text.city
            let range = NSString(string: tmp ?? "").range(of: searchText , options: String.CompareOptions.caseInsensitive)
          return range.location != NSNotFound
        })
          if(searchResultArr.count == 0){
             completion(false)
          } else {
              completion(true)
          }

      }
}
