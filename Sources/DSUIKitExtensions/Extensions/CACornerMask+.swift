// Created for DSUIKitExtensions in 2022
//
// Copyright (c) https://github.com/DuckingSwift

import UIKit

// MARK: - Side

public extension CACornerMask {
	static var all: CACornerMask {
		return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
	}

	static var top: CACornerMask {
		return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
	}

	static var bottom: CACornerMask {
		return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
	}
}
