//
//  NetworkHelper.swift
//  PeopleFromOnlineExercises-ClassNotes
//
//  Created by C4Q  on 11/28/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

//
//  NetworkHelper.swift
//  LoadingImages-InstructorNotes
//
//  Created by C4Q  on 11/27/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class NetworkHelper {
    private init(){}
    static let manager = NetworkHelper()
    private let urlSession = URLSession(configuration: .default)
    func performDataTask(with url: URL, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        urlSession.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                if let error = error {
                    errorHandler(error)
                }
                completionHandler(data)
            }
            }.resume()
    }
}
