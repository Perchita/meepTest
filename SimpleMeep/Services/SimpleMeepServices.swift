//
//  SimpleMeepServices.swift
//  SimpleMeep
//
//  Created by Jose on 22/07/2020.
//  Copyright © 2020 Jose. All rights reserved.
//

import GoogleMaps

public final class SimpleMeepServices {
   
    public static func getResurces(place: String, lowerLeftCoordinate: CLLocationCoordinate2D, upperRightCoordinate: CLLocationCoordinate2D, completion: @escaping ([ResourceModel]?, NSError?) -> Void) -> Void {
    
        var components = URLComponents(string: "\(Constants.baseApi)/\(place)/resources")!
        components.queryItems = [URLQueryItem(name: "lowerLeftLatLon", value: "\(lowerLeftCoordinate.latitude),\(lowerLeftCoordinate.longitude)"), URLQueryItem(name: "upperRightLatLon", value: "\(upperRightCoordinate.latitude),\(upperRightCoordinate.longitude)")]
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        var request : URLRequest = URLRequest(url: components.url!)
        request.allHTTPHeaderFields = ["Content-Type": "application/json; charset=utf-8"]
        request.httpMethod = "GET"
        if let allHttpHeaders = request.allHTTPHeaderFields {
            print(allHttpHeaders)
        }

        print(request)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error as NSError? {
                completion(nil, error)
                return
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(nil, nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let resourceModels = try decoder.decode([ResourceModel].self, from: data)
                completion(resourceModels,nil)
                print(resourceModels)
            } catch  {
                print(error.localizedDescription)
                completion(nil, error as NSError)
            }
            
        }
        
        dataTask.resume()
    }
    
}
 
