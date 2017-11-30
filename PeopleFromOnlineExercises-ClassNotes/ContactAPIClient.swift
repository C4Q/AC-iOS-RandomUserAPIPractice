//
//  ContactAPIClient.swift
//  PeopleFromOnlineExercises-ClassNotes
//
//  Created by C4Q  on 11/28/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct ContactAPIClient {
    private init() {}
    static let manager = ContactAPIClient()
    func getContacts(from urlStr: String, completionHandler: @escaping ([Contact]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let results = try JSONDecoder().decode(Results.self, from: data)
                completionHandler(results.results)
            }
            catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: {print($0)})
    }
}
