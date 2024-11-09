import UIKit
import SwiftUI

@MainActor
enum CounterAssembly {

    static func assembleUiKit() -> UIViewController {
        let viewState = CounterViewState(counter: 1)
        let viewModel = CounterViewModel(state: viewState)
        let reducer = CounterReducer(viewModel: viewModel, logger: Logger())
        let viewController = CounterViewController(viewState: viewState, reducer: reducer)
        viewController.navigationItem.title = "Example UIKit"
        let navViewController = UINavigationController(rootViewController: viewController)
        navViewController.tabBarItem.title = "UIKit"
        navViewController.tabBarItem.image = UIImage(systemName: "lasso")
        return navViewController
    }

    static func assembleSwiftUi() -> UIViewController {
        let viewState = CounterViewState(counter: 1)
        let viewModel = CounterViewModel(state: viewState)
        let reducer = CounterReducer(viewModel: viewModel, logger: Logger())
        let view = CounterSwiftUIView(viewState: viewState, reducer: reducer)
        let viewController = UIHostingController(rootView: view)
        viewController.navigationItem.title = "Example SwiftUI"
        let navViewController = UINavigationController(rootViewController: viewController)
        navViewController.tabBarItem.title = "SwiftUI"
        navViewController.tabBarItem.image = UIImage(systemName: "lasso.badge.sparkles")
        return navViewController
    }
}
