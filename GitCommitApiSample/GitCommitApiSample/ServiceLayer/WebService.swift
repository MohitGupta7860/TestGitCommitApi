//
//  WebService.swift
//  GitCommitApiSample
//
//  Created by Mohit on 11/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import Foundation

protocol WebServiceable {
    func getCommitData(completion:@escaping ([CommitData])->Void)
}

protocol NetworkSession {
    func getCommitData(completion:@escaping ([CommitData])->Void)
}

struct Webservice: WebServiceable {
    private let session: NetworkSession
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }

    func getCommitData(completion:@escaping ([CommitData])->Void) {
        session.getCommitData { list in
            completion(list)
        }
    }
}

extension URLSession: NetworkSession {
    
    func getCommitData(completion:@escaping ([CommitData])->Void) {
          let task = dataTask(with:Enpoint().getCommitsPath()) { (data, response, error) in
               guard let data = data, error == nil else { return }
               let list = try? JSONDecoder().decode([CommitData].self, from: data)
               if let list =  list {
                   completion(list)
               }
           }
           task.resume()
       }
}
