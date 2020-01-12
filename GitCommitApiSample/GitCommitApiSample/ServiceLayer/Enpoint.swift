//
//  Constant.swift
//  GitCommitApiSample
//
//  Created by Mohit on 11/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import Foundation

struct Enpoint {
    let endPoint = "https://api.github.com/repos"
    func getCommitsPath() -> URL {
        let url = URL(fileURLWithPath: endPoint + "MohitGupta7860/SelfLearning/commits")
        return url
    }
}
