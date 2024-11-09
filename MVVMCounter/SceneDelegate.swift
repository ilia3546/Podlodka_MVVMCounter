import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        let tabBar = UITabBarController(nibName: nil, bundle: nil)
        tabBar.viewControllers = [
            CounterAssembly.assembleUiKit(),
            CounterAssembly.assembleSwiftUi(),
        ]
        window.rootViewController = tabBar
        self.window = window
        window.makeKeyAndVisible()
    }
}

