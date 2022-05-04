//
//  MarvelCharacterResult.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 02/05/22.
//

import Foundation

// MARK: - MarvelCharactersResult
struct MarvelResult<T: Codable>: Codable {
    let code: Int?
    let status, message: String?
    let data: MarvelDataClass<T>?
    
    init(){
        self.code = nil
        self.status = nil
        self.message = nil
        self.data = nil
    }
}

// MARK: - DataClass
struct MarvelDataClass <T: Codable>: Codable {
    let offset, limit, total, count: Int?
    let results: [T]?
}
