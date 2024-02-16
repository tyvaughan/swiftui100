//
//  VolumeUnitsEnum.swift
//  C1_UnitConverter_2024
//
//  Created by  Ty Vaughan on 2/16/24.
//

import Foundation

/*
 NOTE: This is no longer being used in place of the built
 in UnitVolume enum.
 */

enum VolumeUnit: String, Equatable, CaseIterable {
    case mL = "mL"
    case L = "L"
    case c = "c"
    case pt = "pt"
    case gal = "gal"
}
