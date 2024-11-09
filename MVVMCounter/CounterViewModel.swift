import Foundation

actor CounterViewModel {

    // MARK: - Nested Types

    enum InputEvent {
        case increaseCounter
        case decreaseCounter
    }

    // MARK: - Private Properties

    private let state: CounterViewState

    // MARK: - Initializer

    init(state: CounterViewState) {
        self.state = state
    }

    // MARK: - Internal Methods

    func handleEvent(_ event: InputEvent) async {
        switch event {
        case .increaseCounter:
            await increaseCounter()

        case .decreaseCounter:
            await decreaseCounter()
        }
    }

    // MARK: - Private Methods

    private func increaseCounter() async {
        await state.update {
            $0.counter += 1
        }
    }

    private func decreaseCounter() async {
        await state.update {
            $0.counter -= 1
        }
    }
}
