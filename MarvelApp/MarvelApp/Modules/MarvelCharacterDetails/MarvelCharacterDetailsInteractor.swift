//
//  MarvelCharacterDetailsInteractor.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import Foundation

class MarvelCharacterDetailsInteractor {
    
    // MARK: - Private properties

    weak var presenter: MarvelCharacterDetailsInteractorDelegate?
}

extension MarvelCharacterDetailsInteractor: MarvelCharacterDetailsInteractorProtocol {
    
}
