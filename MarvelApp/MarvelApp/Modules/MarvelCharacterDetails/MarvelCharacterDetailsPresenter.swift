//
//  MarvelCharacterDetailsPresenter.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import Foundation

enum MarvelCharacterSection {
    case comics
    case series
    case stories
}

class MarvelCharacterDetailsPresenter {
    
    // MARK: - Public properties

    var router: MarvelCharacterDetailsRouterProtocol!
    
    weak var view: MarvelCharacterDetailsViewProtocol?
    var interactor: MarvelCharacterDetailsInteractor!
    var character: MarvelCharacter!

    // MARK: - Private properties

}

extension MarvelCharacterDetailsPresenter: MarvelCharacterDetailsViewDelegate {
    func viewDidLoad() {
        
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return character.comics?.items?.count ?? 0
        case 2:
            return character.series?.items?.count ?? 0
        case 3:
            return character.series?.items?.count ?? 0
        default :
            return 0
        }
    }

    func getCharacterDetails(section: MarvelCharacterSection) -> [MarvelDetailItem]? {
        switch section {
        case .comics:
            return character.comics?.items
        case .stories:
            return character.series?.items
        case .series:
            return character.stories?.items
        }
    }
    
    func getCharacter() -> MarvelCharacter {
        return self.character
    }

}

extension MarvelCharacterDetailsPresenter: MarvelCharacterDetailsInteractorDelegate {
    
}
