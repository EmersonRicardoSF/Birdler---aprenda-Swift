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
        
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    
//    func docAppleDevSenhaButton() {
//        print("Acessar o Doc Apple Dev")
//        
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color: [UIColor] = [.orange,.green,.blue,.red]
        let cell: UITableViewCell = UITableViewCell()
        cell.backgroundColor = color[indexPath.row]
        return cell
        
    }
    
    
}
