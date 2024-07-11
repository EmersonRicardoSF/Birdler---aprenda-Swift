import UIKit
import SideMenu

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let appearanceNav = UINavigationBar.appearance()
        appearanceNav.tintColor = .white
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.overrideUserInterfaceStyle = .dark
        
        let usuarioLogado = UserDefaults.standard.bool(forKey: "UsuarioLogado")
        
        if usuarioLogado {
            let tabBarVC = TabBarVC()
            window.rootViewController = tabBarVC
        } else {
            let loginVC = LoginVC()
            let navVC = UINavigationController(rootViewController: loginVC)
            window.rootViewController = navVC
        }
        
        window.makeKeyAndVisible()
        self.window = window
        
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: SideVC())
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController

        if let rootView = window.rootViewController?.view {
            SideMenuManager.default.addPanGestureToPresent(toView: rootView)
            SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: rootView)
        }
    }
}
