//
//  MarvelListProtocols.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import Foundation

// MARK: - View Protocol

protocol MarvelCharacterListViewProtocol: AnyObject {
    func onFetchCharactersSuccess(characters: [MarvelCharacterLite])
    func onFetchCharactersFailure(error: String)
}


// MARK: - View Delegate

protocol MarvelCharacterListViewDelegate: AnyObject {
    func viewDidLoad()
    func didSelectRowAt(id: Int)
    func configure(cell: MarvelCharacterListCellProtocol, with character: MarvelCharacterLite)
}


// MARK: - Interactor Protocol

protocol MarvelCharacterListInteractorProtocol: AnyObject {
    func fetchmarvelCharactersList()
    func retrieveMarvelCharacter(id: Int)
}


// MARK: - Interactor Delegate

protocol MarvelCharacterListInteractorDelegate: AnyObject {
    func fetchCharacterListSuccess(characters: [MarvelCharacterLite])
    func fetchCharactersListFailure(errorCode: Int)
    func getCharacterSuccess(_ character: MarvelCharacter)
    func getCharacterFailure()
}

// MARK: - Router Protocol

protocol MarvelCharacterListRouterProtocol: AnyObject {
    func showCharacterDetails(character: MarvelCharacter)
}

// MARK: - GroupProfileEditBrandsCellProtocol

protocol MarvelCharacterListCellProtocol: AnyObject {
    func configureCell(character: MarvelCharacterLite)
}
