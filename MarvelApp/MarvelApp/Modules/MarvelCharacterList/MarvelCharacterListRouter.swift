//
//  MarvelListRouter.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import Foundation
import UIKit



class MarvelCharacterListRouter: MarvelCharacterListRouterProtocol{
    
    public weak var viewController: UIViewController?
        
    static func createModule() -> MarvelCharacterListViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MarvelCharacterListViewController") as! MarvelCharacterListViewController
        
        let presenter = MarvelCharacterListPresenter()
        let interactor =  MarvelCharacterListInteractor()
        let router = MarvelCharacterListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
        
    }
    
    static func initModule(viewController: MarvelCharacterListViewController) {
        let interactor = MarvelCharacterListInteractor()
        let router = MarvelCharacterListRouter()
        let presenter = MarvelCharacterListPresenter()
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.viewController = viewController
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func showCharacterDetails(character: MarvelCharacter) {
        DispatchQueue.main.async {
            let detailsModue = MarvelCharacterDetailsRouter.createModule(character: character)
            self.viewController?.navigationController?.pushViewController(detailsModue, animated: true)
        }
    }
}
