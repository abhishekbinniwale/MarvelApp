//
//  MarvelCharacterRequest.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 02/05/22.
//

import Foundation

class MarvelCharacterRequest {
    
    var baseUrl: String
    let characters: String = "characters"
    
    init (baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getCharacters<T: Codable>(id: Int? = nil, onResult: @escaping (MarvelResult<T>) -> Void) {
        
        var getCharactersResponse = MarvelResult<T>()
        var url = "\(baseUrl)/\(characters)"
        if let characterId = id{
            url += "/\(characterId)"
        }
        
        guard let finalUrl = MarvelServiceUtils.buildServiceRequestUrl(baseUrl: url) else{
            onResult(getCharactersResponse)
            return
        }
        
        MarvelServiceUtils.get(url: finalUrl){ response in
            if let dataResponse = response{
                do{
                    let decoder = JSONDecoder()
                    getCharactersResponse = try decoder.decode(type(of: getCharactersResponse), from: dataResponse)
                    onResult(getCharactersResponse)
                    return
                }catch{
                    print("ServiceCharacterRequest getCharacters parse error: \(error)")
                }
            }
            onResult(getCharactersResponse)
        }
    }
    
}

