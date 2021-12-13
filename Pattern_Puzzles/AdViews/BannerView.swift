import GoogleMobileAds
import SwiftUI
import UIKit

struct GADBannerViewController: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> UIViewController {
        let lView = GADBannerView(adSize: GADAdSizeBanner)
        let lViewController = UIViewController()
        lView.adUnitID = "ca-app-pub-2046579846824155/1699868596"
        lView.rootViewController = lViewController
        lViewController.view.addSubview(lView)
        lViewController.view.frame = CGRect(origin: .zero, size: GADAdSizeBanner.size)
        lView.load(GADRequest())
        return lViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
