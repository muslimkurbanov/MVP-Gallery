//
//  GalleryModel.swift
//  MVPtestProject
//
//  Created by Муслим Курбанов on 21.12.2020.
//

import Foundation

struct Imgaes: Decodable {
    let urls: [URLKing.RawValue:String]
    let description: String?
    let alt_description: String?
}
enum URLKing: String {
    case raw
    case full
    case regular
    case small
    case thumb
}

