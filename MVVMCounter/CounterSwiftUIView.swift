import Foundation
import SwiftUI

struct CounterSwiftUIView: View {

    @ObservedObject
    var viewState: CounterViewState
    let reducer: CounterReducer

    var body: some View {
        VStack(spacing: 16, content: {
            Text("Count: \(viewState.counter)")
                .font(.title)
            Button("Increase", action: { reducer(.increaseCounter) })
                .foregroundStyle(Color.blue)
            Button("Decrease", action: { reducer(.decreaseCounter) })
                .foregroundStyle(Color.red)
        })
    }
}
