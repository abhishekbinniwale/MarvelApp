//
//  MarvelListPresenter.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import Foundation


class MarvelCharacterListPresenter: MarvelCharacterListViewDelegate {
    
    // MARK: - Public properties

    var router: MarvelCharacterListRouterProtocol!

    // MARK: - Private properties

    weak var view: MarvelCharacterListViewProtocol?
    var interactor: MarvelCharacterListInteractor!
    
    func viewDidLoad() {
        interactor.fetchmarvelCharactersList()
    }
    
    func didSelectRowAt(id: Int) {
        interactor.retrieveMarvelCharacter(id: id)
    }
    
    func configure(cell: MarvelCharacterListCellProtocol, with character: MarvelCharacterLite) {
        cell.configureCell(character: character)
    }
    
}

extension MarvelCharacterListPresenter: MarvelCharacterListInteractorDelegate {
    func fetchCharacterListSuccess(characters: [MarvelCharacterLite]) {
        view?.onFetchCharactersSuccess(characters: characters)
    }
    
    func fetchCharactersListFailure(errorCode: Int) {
        view?.onFetchCharactersFailure(error: "\(errorCode)")
    }
    
    func getCharacterSuccess(_ character: MarvelCharacter) {
        router.showCharacterDetails(character: character)
    }
    
    func getCharacterFailure() {
        print("Error while retriving vharacter details")
    }
}
