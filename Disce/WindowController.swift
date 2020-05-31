//
//  WindowController.swift
//  Disce
//
//  Created by Kushagra Singh on 5/30/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//
import Cocoa
import SwiftUI

class DetailWindowController<RootView : View>: NSWindowController {
    convenience init(rootView: RootView) {
        let hostingController = NSHostingController(rootView: rootView.frame(width: 800, height: 600))
        let window = NSWindow(contentViewController: hostingController)
        window.setContentSize(NSSize(width: 800, height: 600))
        self.init(window: window)
    }
}
