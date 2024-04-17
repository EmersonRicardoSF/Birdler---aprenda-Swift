//
//  HomeVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/04/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var sections = [sectionStudy]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen = HomeScreen()
        view = homeScreen
        homeScreen?.configProtocolsTableView(delegate: self, dataSource: self)
        homeScreen?.delegate(delegate: self)
        configNavigation()
        configSections()
    }
    
    func configSections() {
        sections.append(contentsOf: [
            
            sectionStudy(title: "Introdução", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionStudy(title: "Lógica aplicada", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionStudy(title: "Xcode", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionStudy(title: "UIKit", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionStudy(title: "Versionamento", description: "Swift", options: [1].compactMap({return "Cell \($0)"}))
        
        
        ])
    }
    
    // MARK: IMPORTANTE (configura a navBar)
    func configNavigation() {
        title = "Birdler"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .secondarySystemBackground
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.hidesBackButton = true
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        if section.opened {
            return section.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as?
//        HomeTableViewCell
//        cell?.setupHomeCell()
//        return cell ?? UITableViewCell()
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
            tableView.layoutIfNeeded()
            let data = sections[indexPath.section]
            cell.screen.nameLabel.text = data.title
            
            
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
            tableView.layoutIfNeeded()
            let data = sections[indexPath.section]
            cell.screen.nameLabel.text = data.description
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//        // MARK: COLOCAR 50 DEPOIS DE CONFIGURADO
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeHeaderView.identifer)
            as? HomeHeaderView
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView.cellForRow(at: indexPath) is HomeTableViewCell else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        sections[indexPath.section].opened = !sections[indexPath.section].opened
        tableView.reloadSections([indexPath.section], with: .automatic)
        
        
    }
}

extension HomeVC: HomeScreenProtocol {
    func tappedEnviarButton() {
        
    }
    
    func customNavigation() {
        
    }
    
    
}

struct sectionStudy {
    
    let title: String
    let description: String
    let options: [String]
    var opened: Bool = false
}
