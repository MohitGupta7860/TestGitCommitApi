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

struct Webservice: WebServiceable {
    
    func getCommitData(completion:@escaping ([CommitData])->Void) {
        
        URLSession.shared.dataTask(with:Enpoint().getCommitsPath()) { (data, response, error) in
            guard let data = data, error == nil else { return }
            let list = try? JSONDecoder().decode([CommitData].self, from: data)
            if let list =  list {
                completion(list)
            }
        }.resume()
    }
}
