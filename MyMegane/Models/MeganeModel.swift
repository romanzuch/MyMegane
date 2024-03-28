//
//  MeganeModel.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 23.03.24.
//

import Foundation
import SwiftUI

enum MeganeModel: String, CaseIterable  {
    case urban130 = "Urban Range 130"
    case comfort130 = "Comfort Range 130"
    case comfort220 = "Comfort Range 220"
    
    var name: String {
        switch self {
        case .urban130:
            return "Urban Range 130"
        case .comfort130:
            return "Comfort Range 130"
        case .comfort220:
            return "Comfort Range 220"
        }
    }
    
    var color: [MeganeColor] {
        switch self {
        case .urban130:
            return MeganeColor.allCases
        case .comfort130:
            return MeganeColor.allCases
        case .comfort220:
            return MeganeColor.allCases
        }
    }
}

enum MeganeColor: String, CaseIterable {
    case gletscherWeiß = "Gletscher Weiß"
    case blackPearl = "Black Pearl"
    case dezirRot = "Dezir Rot"
    case nachtBlau = "Nacht Blau"
    case rafalGrau = "Rafal Grau"
    case schieferGrau = "Schiefer Grau"
    
    var name: String {
        switch self {
        case .gletscherWeiß:
            return "Gletscher Weiß"
        case .blackPearl:
            return "Black Pearl"
        case .dezirRot:
            return "Dezir Rot"
        case .nachtBlau:
            return "Nacht Blau"
        case .rafalGrau:
            return "Rafal Grau"
        case .schieferGrau:
            return "Schiefer Grau"
        }
    }
    
    var imageName: String {
        switch self {
        case .gletscherWeiß:
            return "gw"
        case .blackPearl:
            return "bp"
        case .dezirRot:
            return "dr"
        case .nachtBlau:
            return "nb"
        case .rafalGrau:
            return "rg"
        case .schieferGrau:
            return "sg"
        }
    }
    
    var availableRoofs: [MeganeRoof] {
        switch self {
        case .gletscherWeiß:
            return MeganeRoof.allCases
        case .blackPearl:
            return [MeganeRoof.body]
        case .dezirRot:
            return [MeganeRoof.body]
        case .nachtBlau:
            return [MeganeRoof.body]
        case .rafalGrau:
            return [MeganeRoof.body]
        case .schieferGrau:
            return [MeganeRoof.body]
        }
    }
}

enum MeganeRoof: String, CaseIterable {
    case black = "Schwarz"
    case body = "In Wagenfarbe"
    
    var name: String {
        switch self {
        case .black:
            return "Schwarz"
        case .body:
            return "In Wagenfarbe"
        }
    }
    
    var imagePrefix: String {
        switch self {
        case .black:
            return "accent_"
        case .body:
            return "body_"
        }
    }
}
