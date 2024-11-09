import Foundation

@MainActor
final class CounterViewState: ObservableObject, Sendable {

    @Published var counter: Int

    init(counter: Int) {
        self.counter = counter
    }
}

extension CounterViewState {

    func update(_ handler: @Sendable @MainActor (CounterViewState) -> Void) async {
        await MainActor.run { handler(self) }
    }
}
