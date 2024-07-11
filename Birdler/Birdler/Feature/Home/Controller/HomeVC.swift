import SideMenu
import UIKit
import FirebaseFirestore
import FirebaseAuth

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var HomeData: [HomeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen = HomeScreen()
        view = homeScreen
        homeScreen?.configProtocolsTableView(delegate: self, dataSource: self)
        homeScreen?.delegate(delegate: self)
        // Registro da célula personalizada
          homeScreen?.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
          
          // Configuração para altura automática da célula
          homeScreen?.tableView.rowHeight = UITableView.automaticDimension
          homeScreen?.tableView.estimatedRowHeight = 44
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
    
    override func viewWillAppear(_ animated: Bool) {
        loadHome()
        fetchUserName()
    }
    
    func fetchUserName() {
        // Verifique se o usuário está logado
        guard let userID = Auth.auth().currentUser?.uid else {
            // Se o usuário não estiver logado, exiba apenas "Olá"
            DispatchQueue.main.async {
                self.homeScreen?.greetingLabel.text = "Olá"
            }
            return
        }
        
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userID)
        
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let nome = data?["nome"] as? String ?? "Usuário"
                DispatchQueue.main.async {
                    self.homeScreen?.greetingLabel.text = "Olá, \(nome)."
                }
            } else {
                print("Documento não encontrado ou erro ao recuperar: \(error?.localizedDescription ?? "Erro desconhecido")")
            }
        }
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        tableView.layoutIfNeeded()
        let data = HomeData[indexPath.section].sections?[indexPath.row]
        cell.screen.nameLabel.text = data
        cell.backgroundColor = .secondarySystemBackground
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HomeHeaderView.identifier) as? HomeHeaderView
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
        let menu = SideMenuNavigationController(rootViewController: SideVC())
        present(menu, animated: true, completion: nil)
    }
}

struct sectionStudy {
    let title: String
    let description: String
    let options: [String]
    var opened: Bool = false
}
