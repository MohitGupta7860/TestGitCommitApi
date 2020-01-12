//
//  GitCommitViewModel.swift
//  GitCommitApiSample
//
//  Created by Mohit on 11/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import Foundation

protocol CommitViewable {
     func getCommitData(completion:@escaping ()->Void)
    var webService: WebServiceable { get set }
    var commitList: [CommitData] { get }
}

class CommitViewModel: CommitViewable {
    var webService: WebServiceable = Webservice()
    var commitList = [CommitData] ()
    
    func getCommitData(completion:@escaping ()->Void) {
        webService.getCommitData { [weak self] list in
            self?.commitList = list
            completion()
        }
    }
}
