//
//  ViewController.swift
//  GitCommitApiSample
//
//  Created by Mohit on 11/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    lazy var viewModel: CommitViewModel = {
        let viewModel = CommitViewModel()
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCommitData(completion: {})
    }
}

