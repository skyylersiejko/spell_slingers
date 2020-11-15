//
//  GameLoop.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 11/15/20.
//  Copyright © 2020 Skyyler Siejko. All rights reserved.
//

import Foundation
import UIKit

class GameLoop : NSObject {

    var doSomething: () -> ()?
    var displayLink : CADisplayLink!

    init(doSomething: @escaping () -> ()) {
        self.doSomething = doSomething
        super.init()
        start()
    }

    // you could overwrite this too
    @objc func handleTimer() {
        doSomething()
    }
   
   func start() {
        displayLink = CADisplayLink(target: self, selector: #selector(handleTimer))
        /*
        * If set to zero, the
        * display link will fire at the native cadence of the display hardware.
        * The display link will make a best-effort attempt at issuing callbacks
        * at the requested rate.
        */
        displayLink.preferredFramesPerSecond = 0
        displayLink.add(to: .main, forMode: RunLoop.Mode.common)
    }

    func stop() {
        displayLink.invalidate()
        displayLink.remove(from: .main, forMode: RunLoop.Mode.common)
        displayLink = nil
    }
}
