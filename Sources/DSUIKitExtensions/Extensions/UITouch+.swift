// Created for  in 2022
//
// Copyright (c) https://github.com/DuckingSwift

import UIKit

// MARK: - ControlEvent

public extension UITouch {
	/// Convert UITouch to UIControl.Event
	var toControl: UIControl.Event? {
		guard let view = self.view else { return nil }
		let isInside = view.bounds.contains(location(in: view))
		let wasInside = view.bounds.contains(previousLocation(in: view))
		switch phase {
		case .began:
			guard isInside else { return nil }
			return tapCount > 1 ? .touchDownRepeat : .touchDown
		case .moved:
			if isInside, wasInside {
				return .touchDragInside
			} else if isInside, !wasInside {
				return .touchDragEnter
			} else if !isInside, wasInside {
				return .touchDragExit
			} else if !isInside, !wasInside {
				return .touchDragOutside
			}
			return nil
		case .ended:
			return isInside ? .touchUpInside : .touchUpOutside
		case .cancelled:
			return .touchCancel
		default:
			return nil
		}
	}
}
