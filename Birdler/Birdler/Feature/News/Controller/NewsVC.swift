//
//  NewsVC.swift
//  Birdler
//
//  Created by Nayla on 20/4/2024.
//

import UIKit

class NewsVC: UIViewController {

    var newsScreen: NewsScreen?
    
    override func loadView() {
        self.newsScreen = NewsScreen()
        self.view = newsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.newsScreen?.delegate(delegate: self)
        overrideUserInterfaceStyle = .dark
        
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .secondarySystemBackground
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsHearderView.identifier)
            as? NewsHearderView
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 32
        } else {
            return 0
        }
    }
    
}

extension NewsVC: NewsScreenProtocol {
    func tappedDocAppleDevButton() {
        print("Acessar o Doc Apple Dev")
        openSafariPageWith(url: "https://developer.apple.com/documentation/")
    }
    
    
}
