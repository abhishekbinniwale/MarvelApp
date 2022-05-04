//
//  MarvelCharacterListViewController.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import UIKit

class MarvelCharacterListViewController: UIViewController {

    // MARK: - IBOutlet properties

    @IBOutlet weak var marvelList: UITableView!
    
    // MARK: - Public properties

    var presenter: MarvelCharacterListViewDelegate?
    var charactersList: [MarvelCharacterLite] = []
    
    

    // MARK: - Private properties
    private let cellIdentifier = "MarvelListTableViewCell"
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.marvelList.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.setUPUI()
        self.pullToRefresh()
        MarvelCharacterListRouter.initModule(viewController: self)
        presenter?.viewDidLoad()
    }

    func setUPUI() {
       self.marvelList.delegate = self
       self.marvelList.dataSource = self
       self.marvelList.reloadData()
    }
    
    func pullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Update marvels")
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        marvelList.addSubview(refreshControl)
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        presenter?.viewDidLoad()
    }
}

// MARK: - Table view delegate

extension MarvelCharacterListViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MarvelListTableViewCell else {
            return UITableViewCell()
        }
        
        presenter?.configure(cell: cell, with: charactersList[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if charactersList.count >= indexPath.row {
           if let characterID = charactersList[indexPath.row].id {
               presenter?.didSelectRowAt(id: characterID)
            }
       }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension MarvelCharacterListViewController: MarvelCharacterListViewProtocol {
    func onFetchCharactersSuccess(characters: [MarvelCharacterLite]) {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.charactersList.append(contentsOf: characters)
            self.marvelList.reloadData()
        }
    }
    
    func onFetchCharactersFailure(error: String) {
        refreshControl.endRefreshing()
        print("Error :\(error)")
    }
}
