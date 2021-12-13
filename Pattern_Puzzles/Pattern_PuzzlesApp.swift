import SwiftUI
import GoogleMobileAds

@main
struct Pattern_PuzzlesApp: App {
    init() {
        GADMobileAds.sharedInstance()
            .start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(QuestionViewModel())
        }
    }
}
