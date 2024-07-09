//
//  NewsVC.swift
//  Birdler
//
//  Created by Nayla on 20/4/2024.
//

import UIKit
import SafariServices

class NewsVC: UIViewController {

    var newsScreen: NewsScreen?
    var service = Service()
    
    var newsInfos: [NewsModel] = []
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNews()
    }
    
    private func fetchNews() {
        service.getNews { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let newsList):
                print(newsList)
                self.newsInfos = newsList  // Aqui estamos substituindo o array em vez de adicionar ao conteúdo existente

                DispatchQueue.main.async {
                    self.newsScreen?.tableView.reloadData()
                }
            case .failure(let error):
                print("Erro ao obter notícias: \(error.localizedDescription)")
            }
        }
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        let news = newsInfos[indexPath.row]
        cell.configure(with: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsHearderView.identifier) as? NewsHearderView
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsInfos[indexPath.row]
        if let link = news.newsLink, let url = URL(string: link) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NewsVC: NewsScreenProtocol {
    func tappedDocAppleDevButton() {
        print("Acessar o Doc Apple Dev")
        openSafariPageWith(url: "https://developer.apple.com/documentation/")
    }
}
