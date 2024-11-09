import UIKit
import Combine

final class CounterViewController: UIViewController {

    // MARK: - Private Properties

    private let viewState: CounterViewState
    private let reducer: CounterReducer
    private var bag = Set<AnyCancellable>()

    // MARK: - Outlets

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Increase", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(CounterViewController.increaseButtonDidTap), for: .touchUpInside)
        return button
    }()

    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Decrease", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(CounterViewController.decreaseButtonDidTap), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    init(viewState: CounterViewState, reducer: CounterReducer) {
        self.viewState = viewState
        self.reducer = reducer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindCounterViewState()
    }

    // MARK: - Configuration

    private func bindCounterViewState() {
        viewState.$counter
            .map({ "Count: \($0)" })
            .assign(to: \.text, on: label)
            .store(in: &bag)
    }

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(increaseButton)
        view.addSubview(decreaseButton)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            increaseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            increaseButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            decreaseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            decreaseButton.topAnchor.constraint(equalTo: increaseButton.bottomAnchor, constant: 16),
        ])
    }

    // MARK: - Private Methods

    @objc
    private func increaseButtonDidTap() {
        reducer(.increaseCounter)
    }

    @objc
    private func decreaseButtonDidTap() {
        reducer(.decreaseCounter)
    }
}
