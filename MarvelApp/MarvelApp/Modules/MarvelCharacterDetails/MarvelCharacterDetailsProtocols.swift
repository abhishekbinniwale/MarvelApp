//
//  MarvelCharacterDetailsProtocols.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import Foundation

// MARK: - View Protocol

protocol MarvelCharacterDetailsViewProtocol: AnyObject {

}


// MARK: - View Delegate

protocol MarvelCharacterDetailsViewDelegate: AnyObject {
    func viewDidLoad()
    func numberOfRowsInSection(section: Int) -> Int
    func getCharacterDetails(section: MarvelCharacterSection) -> [MarvelDetailItem]?
    func getCharacter() -> MarvelCharacter
}


// MARK: - Interactor Protocol

protocol MarvelCharacterDetailsInteractorProtocol: AnyObject {

}


// MARK: - Interactor Delegate

protocol MarvelCharacterDetailsInteractorDelegate: AnyObject {
}


// MARK: - Router Protocol

protocol MarvelCharacterDetailsRouterProtocol: AnyObject {

}

// MARK: - MarvelCharacterDetailsCellProtocol

protocol MarvelCharacterDetailsCellProtocol: AnyObject {

}
