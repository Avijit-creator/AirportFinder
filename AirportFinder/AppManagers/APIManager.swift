//
//  APIManager.swift
//  AirportFinder
//
//  Created by Avijit on 02/07/21.
//

import Foundation
import Foundation
import Alamofire


final class APIManager {
    
    static let shared   = APIManager()

    //MARK:- //Fetch list Data
    func FetchApiDataMethod(parameter : [String: Any],completion : @escaping ([AirportModel]) -> Void) {
    
        AF.sessionConfiguration.timeoutIntervalForRequest = 60
       
        let encoding: ParameterEncoding = JSONEncoding.default

        debugPrint("API Name: ==>>",API.airport)

        AF.request(URL (string: API.airport)!, method:.get, encoding:encoding, headers: nil).validate(statusCode: 200..<600).responseJSON { (response) in
            switch response.result {
            case .success:
               // print("API Response: ====>",response)
                guard let data = response.data else {return}
                let jsonDecoder = JSONDecoder()
                do{
                    let manufacturerData = try jsonDecoder.decode([AirportModel].self, from: data)
                    completion(manufacturerData)
                } catch (let error) {
                    print(error)
                }
            case .failure(let error):
                    print("Api Error:- ",error.localizedDescription )
            }
        }
    }
}
