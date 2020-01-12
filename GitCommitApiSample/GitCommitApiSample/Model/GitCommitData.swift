//
//  GitCommitData.swift
//  GitCommitApiSample
//
//  Created by Mohit on 11/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import Foundation

struct CommitData: Decodable {
    let commit: Commit
    let hashKey: String
    
    enum CodingKeys: String, CodingKey {
        case hashKey =  "sha"
        case commit
    }
}

struct Commit: Decodable {
    let author: Author
    let message: String
}

struct Author: Decodable {
    let name: String
}
