//
//  MarvelService.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 02/05/22.
//

import Foundation

class MarvelService {
    
    var baseUrl = ""
    
    init() {
        baseUrl = MarvelConfig.serverUri
    }
    
    func getCharactersList(onResult: @escaping (MarvelResult<MarvelCharacterLite>) -> Void){
        MarvelCharacterRequest(baseUrl: self.baseUrl).getCharacters{ response in
            onResult(response)
        }
    }
    
    
    func getCharacter(id: Int, onResult: @escaping (MarvelResult<MarvelCharacter>) -> Void){
        MarvelCharacterRequest(baseUrl: self.baseUrl).getCharacters(id: id){ response in
            onResult(response)
        }
    }
}
