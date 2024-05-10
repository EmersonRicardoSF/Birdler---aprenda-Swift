//
//  ExerciseVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 18/04/2024.
//

import UIKit

class ExerciseVC: UIViewController {
    
    var exerciseScreen: ExerciseScreen?
    var sections = [sectionStudy]()
    
    override func loadView() {
        exerciseScreen = ExerciseScreen()
        view = exerciseScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configSections()
    }
    
    
    func configSections() {
        sections.append(contentsOf: [
            
            sectionStudy(title: "Introdução", description: "Swift", options: [1, 2].compactMap({return "Cell \($0)"})),
            sectionStudy(title: "Lógica aplicada", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionStudy(title: "Xcode", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionStudy(title: "UIKit", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionStudy(title: "Versionamento", description: "Swift", options: [1].compactMap({return "Cell \($0)"}))
            
            
        ])
    }
    
}
    
    extension ExerciseVC: UITableViewDelegate, UITableViewDataSource {
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
            guard let cell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell else { return }
            tableView.deselectRow(at: indexPath, animated: true)
            sections[indexPath.section].opened = !sections[indexPath.section].opened
            tableView.reloadSections([indexPath.section], with: .automatic)
            
        }
    }
    

