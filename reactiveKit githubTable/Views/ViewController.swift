//
//  ViewController.swift
//  reactiveKit githubTable
//
//  Created by Abdulmajeed khalid on 11/07/2018.
//  Copyright © 2018 Abdulmajeed khalid. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultsCount: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ReposViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
    
        _ = viewModel.searchText.bidirectionalBind(to: searchBar.reactive.text)
        _ = viewModel.resultCount.bind(to: resultsCount.reactive.text)
        _ = viewModel.repositories.bind(to: tableView) { dataSource , indexPath , tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoCell
            
            let repo = dataSource[indexPath.row]
            
            cell.repoNameLabel.text = repo.repoName
            cell.repoOwnerLabel.text = repo.ownerName
            cell.repoStarsCountLabel.text = "\(repo.repoStarts ?? 0)"
            cell.repoDiscriptionLabel.text = repo.repoDiscription
            
            return cell
        }
        
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

