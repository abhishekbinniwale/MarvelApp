//
//  MarvelCharacter.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 02/05/22.
//

import Foundation

// MARK: - MarvelCharacter
struct MarvelCharacterLite: Codable {
    let id: Int?
    let name, description: String?
    let thumbnail: MarvelThumbnail?
}

// MARK: - MSCharacter
struct MarvelCharacter: Codable {
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: MarvelThumbnail?
    let resourceURI: String?
    let comics, series: MarvelDetail?
    let stories: MarvelDetail?
    let events: MarvelDetail?
    let urls: [MarvelURLElement]?
}

// MARK: - Detail
struct MarvelDetail: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [MarvelDetailItem]?
    let returned: Int?
}

// MARK: - DeatilItem
struct MarvelDetailItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: String?
}


// MARK: - Thumbnail
struct MarvelThumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct MarvelURLElement: Codable {
    let type: String?
    let url: String?
}
