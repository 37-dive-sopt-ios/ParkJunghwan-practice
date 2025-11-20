//
//  addSubviews.swift
//  sopt-37th-03Seminar
//
//  Created by 박정환 on 11/1/25.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
