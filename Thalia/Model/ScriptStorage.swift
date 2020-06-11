//
//  Storage.swift
//  Thalia
//
//  Created by Samuel Kebis on 27/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import Foundation

extension Storage {
    static func save(_ script: Script) {
        Storage.store(script, to: .documents, as: "theOnlyOneScript")
    }
    
    static func getScript() -> Script? {
        if Storage.fileExists("theOnlyOneScript", in: .documents) {
            return Storage.retrieve("theOnlyOneScript", from: .documents, as: Script.self)
        } else {
            return nil
        }
    }
}
