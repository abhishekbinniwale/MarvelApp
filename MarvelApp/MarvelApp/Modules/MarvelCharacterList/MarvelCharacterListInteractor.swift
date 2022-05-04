//
//  MarvelCharacterListInteractor.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import Foundation

class MarvelCharacterListInteractor: MarvelCharacterListInteractorProtocol {
    
    // MARK: - Private properties

    weak var presenter: MarvelCharacterListInteractorDelegate?
    let marvelService = MarvelService()
    var characterList: [MarvelCharacterLite]?
    
    func fetchmarvelCharactersList() {
        marvelService.getCharactersList { response in
            if response.code == 200 {
                self.characterList = response.data?.results
                self.presenter?.fetchCharacterListSuccess(characters: self.characterList ?? [MarvelCharacterLite]())
            } else {
                self.presenter?.fetchCharactersListFailure(errorCode: response.code ?? 0)
            }
        }
    }
    
    func retrieveMarvelCharacter(id: Int) {
        marvelService.getCharacter(id: id) { response in
            if let result = response.data?.results?.first {
                self.presenter?.getCharacterSuccess(result)
            } else {
                self.presenter?.getCharacterFailure()
            }
        }
    }
}
