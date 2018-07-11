//
//  ReposViewModel.swift
//  reactiveKit githubTable
//
//  Created by Abdulmajeed khalid on 11/07/2018.
//  Copyright © 2018 Abdulmajeed khalid. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond
import Alamofire

class ReposViewModel {
    
    let repositories = MutableObservableArray<Repository>([])
    let searchText = Observable<String?>("")
    let disposeBag = DisposeBag()
    let resultCount = Observable<String?>("")
    init() {
        _ = searchText
            .filter{$0!.count > 0 }
            .throttle(seconds: 1)
            .observeNext{ _ in
                self.fetchRepos()
            }.dispose(in: disposeBag)
        
        }

    func fetchRepos()  {
        let parameters: Parameters = [
            "q" : "\(self.searchText.value!)"
        ]
        NetworkManager.shared.fetch(parameters: parameters, httpHeader: nil) { (response) in
            let repoResponse = response as! RepositoryResponse
            self.resultCount.value = "\(repoResponse.resultsCount!)"
            self.repositories.removeAll()
            self.repositories.insert(contentsOf: repoResponse.repositories!, at: 0)
        }
    }
    
    
}

    

