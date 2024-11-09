import Foundation

final class CounterReducer: Sendable {

    private let viewModel: CounterViewModel
    private let logger: Logger

    init(viewModel: CounterViewModel, logger: Logger) {
        self.viewModel = viewModel
        self.logger = logger
    }

    func callAsFunction(_ event: CounterViewModel.InputEvent, function: String = #function, file: String = #file) {
        Task {
            logger.log("Perform event:", event)
            await viewModel.handleEvent(event)
        }
    }
}

final class Logger: Sendable {

    func log(_ value: Any...) {
        print(value)
    }
}
