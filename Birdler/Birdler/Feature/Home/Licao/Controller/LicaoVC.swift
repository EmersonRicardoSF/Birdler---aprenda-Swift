//
//  LicaoVC.swift
//  Birdler
//
//  Created by Nayla on 31/5/2024.
//

import UIKit

class LicaoVC: UIViewController {
    
    var licaoScreen: LicaoScreen?
    
    var licao: String?
    
    init(licao: String? = nil) {
        self.licao = licao
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView(nome: licao ?? "")
    }
    
    override func loadView() {
        licaoScreen = LicaoScreen()
        view = licaoScreen
        
    }
    
    func configView(nome: String) {
        print("Sou a Lição de \(nome)")
        licaoScreen?.aulaConteudoTextView.attributedText = .init(chapterName: nome)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = licao
        
    }
}
