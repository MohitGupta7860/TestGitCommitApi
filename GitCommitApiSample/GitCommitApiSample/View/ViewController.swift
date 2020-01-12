//
//  ViewController.swift
//  GitCommitApiSample
//
//  Created by Mohit on 11/01/20.
//  Copyright © 2020 Mohit. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var commitListTableView: UITableView!
    
    lazy var viewModel: CommitViewModel = {
        let viewModel = CommitViewModel()
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabeView()
        
        viewModel.getCommitData(completion: {
            DispatchQueue.main.async {
                self.commitListTableView.reloadData()
            }
        })
    }
    
    private func setupTabeView() {
        // MARK: Configure the tableviewcell
        commitListTableView.register(UINib(nibName: "CommitFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "CommitFeedTableViewCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    // MARK: TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commitFeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CommitFeedTableViewCell", for: indexPath) as? CommitFeedTableViewCell else  { return UITableViewCell() }
        commitFeedTableViewCell.configureCell(commitFeed: viewModel.commitList[indexPath.row])
        return commitFeedTableViewCell
    }
}
