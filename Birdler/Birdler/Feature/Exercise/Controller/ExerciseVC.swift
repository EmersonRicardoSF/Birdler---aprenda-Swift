//
//  ExerciseVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 18/04/2024.
//

import UIKit

class ExerciseVC: UIViewController {
    
    var exerciseScreen: ExerciseScreen?
    var sections = [sectionExercise]()
    
    override func loadView() {
        exerciseScreen = ExerciseScreen()
        view = exerciseScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        exerciseScreen?.configProtocolsTableView(delegate: self, dataSource: self)
        exerciseScreen?.delegate(delegate: self)
        configSections()
        overrideUserInterfaceStyle = .dark
    }
    
    
    func configSections() {
        sections.append(contentsOf: [
            
            sectionExercise(title: "Introdução", description: "Swift", options: [1, 2].compactMap({return "Cell \($0)"})),
            sectionExercise(title: "Lógica aplicada", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionExercise(title: "Xcode", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionExercise(title: "UIKit", description: "Swift", options: [1].compactMap({return "Cell \($0)"})),
            sectionExercise(title: "Versionamento", description: "Swift", options: [1].compactMap({return "Cell \($0)"}))
            
            
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
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.identifier, for: indexPath) as? ExerciseTableViewCell else {return UITableViewCell()}
            tableView.layoutIfNeeded()
            let data = sections[indexPath.section]
            cell.screen.nameLabel.text = data.title
            
            
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.identifier, for: indexPath) as? ExerciseTableViewCell else {return UITableViewCell()}
            tableView.layoutIfNeeded()
            let data = sections[indexPath.section]
            cell.screen.nameLabel.text = data.description
            return cell
        }
    }
    
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
            return 50
        } else {
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ExerciseTableViewCell else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        sections[indexPath.section].opened = !sections[indexPath.section].opened
        tableView.reloadSections([indexPath.section], with: .automatic)
        
    }
}

extension ExerciseVC: ExerciseScreenProtocol {
    func customNavigation() {
        
    }
    
    
}

struct sectionExercise {
    
    let title: String
    let description: String
    let options: [String]
    var opened: Bool = false
}
