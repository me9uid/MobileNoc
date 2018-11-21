//
//  NetworkService.swift
//  MobileNocTask
//
//  Created by Ahmed Meguid on 11/21/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class NetworkService: NSURLConnectionDelegate {
    
    func getAlertsList(page: Int, size: Int)  {
        let username = "user"
        let password = "pass"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let url = URL(string: String(format: "https://45.55.43.15:9090/api/machine?page=%@&size=%@", page, size))!
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        // fire off the request
        // make sure your class conforms to NSURLConnectionDelegate
        let urlConnection = NSURLConnection(request: request, delegate: self)

    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        <#code#>
    }
    }
