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
        configNavigation()
        overrideUserInterfaceStyle = .dark
    }
    
    func configNavigation() {
        let privacyPoliceButton = UIBarButtonItem(image: UIImage(systemName: "book.pages"), style: .plain, target: self, action: #selector(openPrivacyPolice))
        
        let termsAndConditionsButton = UIBarButtonItem(title: "Terms & Conditions", style: .plain, target: self, action: #selector(openTermsAndConditions))
        
        
        
        navigationItem.rightBarButtonItem = termsAndConditionsButton
        navigationItem.leftBarButtonItem = privacyPoliceButton

    }
    
    @objc func openPrivacyPolice() {
        self.openSafariPageWith(url: "https://doc-hosting.flycricket.io/birdler-privacy-policy/c0033192-bd5c-493f-bb02-9742f367e22b/privacy")
    }
    
    @objc func openTermsAndConditions() {
        self.openSafariPageWith(url: "https://doc-hosting.flycricket.io/birdler-terms-of-use/37ac2e0e-8209-407d-b2fa-218db2997d64/terms")
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
