//
//  SafariView.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 13.12.2023.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    let onLoginComplete: () -> Void
    
    func makeUIViewController(context: Context) -> UIViewController {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = context.coordinator
        return safariViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // glushilka
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, SFSafariViewControllerDelegate {
        let parent: SafariView

        init(parent: SafariView) {
            self.parent = parent
        }

        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            parent.onLoginComplete()
            controller.dismiss(animated: true, completion: nil)
        }
    }
}
