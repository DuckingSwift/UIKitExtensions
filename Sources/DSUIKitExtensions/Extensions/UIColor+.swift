// Created for DSUIKitExtensions in 2022
//
// Copyright (c) https://github.com/DuckingSwift

import UIKit

// MARK: - Hex

public extension UIColor {
	/// Initalize UIColor from hex string
	/// Support format: R1G2B3, #R1G2B3, R1G2B3FF, #R1G2B3FF
	convenience init(hex: String) {
		let r, g, b, a: CGFloat

		var mHex = hex
		if !mHex.hasPrefix("#") { mHex.insert("#", at: hex.startIndex) }
		if mHex.count != 9 { mHex.append("FF") }

		let start = mHex.index(mHex.startIndex, offsetBy: 1)
		let hexColor = String(mHex[start...])
		let scanner = Scanner(string: hexColor)
		var hexNumber: UInt64 = 0

		if !scanner.scanHexInt64(&hexNumber) {
			assertionFailure("Wrong hex value")
			self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
			return
		}

		r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
		g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
		b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
		a = CGFloat(hexNumber & 0x0000_00FF) / 255
		self.init(red: r, green: g, blue: b, alpha: a)
	}
}
