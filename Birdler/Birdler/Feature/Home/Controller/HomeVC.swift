//
//  HomeVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/04/2024.
//
import SideMenu
import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    var HomeData: [HomeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen = HomeScreen()
        view = homeScreen
        homeScreen?.configProtocolsTableView(delegate: self, dataSource: self)
        homeScreen?.delegate(delegate: self)
        configNavigation()
        loadHome()
    }
    
    func loadHome() {
        if let home = Bundle.main.url(forResource: "Home", withExtension: "json") {
            do {
                let data = try Data(contentsOf: home)
                let decoder = JSONDecoder()
                HomeData = try decoder.decode([HomeModel].self, from: data)
                homeScreen?.tableView.reloadData()
            } catch {
                print("Erro ao tentar obter Home.")
            }
        }
    }
    
    // MARK: IMPORTANTE (configura a navBar)
    func configNavigation() {
        navigationItem.title = "Birdler"
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
        return HomeData[section].sections?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return HomeData[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
        tableView.layoutIfNeeded()
        let data = HomeData[indexPath.section].sections?[indexPath.row]
        cell.screen.nameLabel.text = data
        cell.backgroundColor = .secondarySystemBackground
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 50
    //        // MARK: COLOCAR 50 DEPOIS DE CONFIGURADO
    //    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeHeaderView.identifier)
            as? HomeHeaderView
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 100
        } else {
            return 50
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = HomeData[indexPath.section].sections?[indexPath.row]
        let vc = LicaoVC(licao: data)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        print(data ?? "")
        
    }
}

extension HomeVC: HomeScreenProtocol {
    func customNavigation() {
      
    }
    
    func tappedEnviarButton() {
        
    }
    
    
    func testNavigation() {
        // Defina o menu
        let menu = SideMenuNavigationController(rootViewController: SideVC())

        // Apresentar o menu
        present(menu, animated: true, completion: nil)
    }
    
//    func testNavigation() {
//        let vc: SideVC = SideVC()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    

struct sectionStudy {
    
    let title: String
    let description: String
    let options: [String]
    var opened: Bool = false
}

