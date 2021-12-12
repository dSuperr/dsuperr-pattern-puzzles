import SwiftUI

@main
struct Pattern_PuzzlesApp: App {
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(QuestionViewModel())
        }
    }
}
