//
//  TopAlignedTextField.swift
//  Demos
//
//  Created by Mohammad Noor on 8/10/24.
//

import UIKit

class TopAlignedTextField: UITextField {

    // Padding for the placeholder and text
    let padding = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)

    // Adjust the placeholder's position
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.placeholderRect(forBounds: bounds)
        rect.origin.y = bounds.origin.y + padding.top
        return rect
    }

    // Adjust the text's position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        rect.origin.y = bounds.origin.y + padding.top
        return rect
    }

    // Adjust the editing text's position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.editingRect(forBounds: bounds)
        rect.origin.y = bounds.origin.y + padding.top
        return rect
    }
}

