//
//  HomeVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/04/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen = HomeScreen()
        view = homeScreen
        homeScreen?.configProtocolsTableView(delegate: self, dataSource: self)
        homeScreen?.delegate(delegate: self)
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as?
        HomeTableViewCell
        cell?.setupHomeCell()
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        // MARK: COLOCAR 50 DEPOIS DE CONFIGURADO
    }
    
}

extension HomeVC: HomeScreenProtocol {
    func customNavigation() {
        
    }
    
    
}
