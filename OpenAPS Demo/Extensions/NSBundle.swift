//
//  NSBundle.swift
//  OpenAPS Demo
//
//  Created by Nathan Racklyeft on 5/7/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import Foundation


extension NSBundle {
    var HTMLResources: NSURL? {
        return URLForResource("HTML", withExtension: nil)
    }
}
