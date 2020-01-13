//
//  WebServiceTest.swift
//  GitCommitApiSampleTests
//
//  Created by Mohit on 12/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//

import XCTest
@testable import GitCommitApiSample

class WebServiceTest: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
    }
    
    func testSuccessfulResponse() {
        let mockSession = NetworkSessionMock()
        let subject = Webservice(session: mockSession)
        
        let expectation = self.expectation(description: "Getting data for latest commit")
        subject.getCommitData { list in
            expectation.fulfill()
            XCTAssertTrue(list.count == 1)
            let commitData = list[0]
            XCTAssertEqual(commitData.commit.author.name, "TestAuthorName")
        }
        waitForExpectations(timeout: 1)
    }
}

class NetworkSessionMock: NetworkSession {
    var data: Data?
    func getCommitData(completion: @escaping ([CommitData]) -> Void) {
        let author = Author(name: "TestAuthorName")
        let commit = Commit(author: author , message: "TestMessage")
        let commitData = CommitData(commit: commit, hashKey: "TestHashKey")
        completion([commitData])
    }
}
