//
//  Extensions.swift
//  Thalia
//
//  Created by Paolo Merlino on 22/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import Foundation

extension Date
{
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
