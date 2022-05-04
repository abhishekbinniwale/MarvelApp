//
//  MarvelCharacterDetailsRouter.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import Foundation
import UIKit

class MarvelCharacterDetailsRouter: MarvelCharacterDetailsRouterProtocol{
    
    static func createModule(character: MarvelCharacter) -> MarvelCharacterDetailsViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MarvelCharacterDetailsViewController") as! MarvelCharacterDetailsViewController
        
        let presenter = MarvelCharacterDetailsPresenter()
        let interactor =  MarvelCharacterDetailsInteractor()
        let router = MarvelCharacterDetailsRouter()
        
        view.presenter = presenter
        
        presenter.view = view as? MarvelCharacterDetailsViewProtocol
        presenter.router = router
        presenter.interactor = interactor
        presenter.character = character
        
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
