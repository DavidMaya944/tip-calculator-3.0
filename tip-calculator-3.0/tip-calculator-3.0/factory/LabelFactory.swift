//
//  LabelFactory.swift
//  tip-calculator-3.0
//
//  Created by David Jesús Maya Quirós on 18/04/2023.
//

import UIKit

struct LabelFactory {
    static func build(
        text: String,
        font: UIFont,
        backgroundColor: UIColor = .clear,
        textColor: UIColor = ThemeColor.text,
        textAlignment: NSTextAlignment = .center) -> UILabel {
            let label = UILabel()
            label.text = text
            label.font = font
            label.backgroundColor = backgroundColor
            label.textColor = textColor
            label.textAlignment = textAlignment
            return label
        }
}
