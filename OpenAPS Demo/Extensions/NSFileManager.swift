//
//  NSFileManager.swift
//  OpenAPS Demo
//
//  Created by Nathan Racklyeft on 5/7/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import Foundation


extension NSFileManager {
    var documentsDirectory: NSURL? {
        return URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first
    }

    var HTMLDirectory: NSURL? {
        return documentsDirectory?.URLByAppendingPathComponent("HTML", isDirectory: true)
    }
}