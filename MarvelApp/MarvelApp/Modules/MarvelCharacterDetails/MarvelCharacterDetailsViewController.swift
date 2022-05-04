//
//  MarvelCharacterDetailsViewController.swift
//  MarvelApp
//
//  Created by Abhishek Binniwale on 27/04/22.
//

import UIKit

class MarvelCharacterDetailsViewController: UIViewController {
   
    // MARK: - IBOutlet properties

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public properties

    var presenter: MarvelCharacterDetailsViewDelegate!

    // MARK: - Private properties
    private let sectionsTitle = ["Description", "Comics", "Series", "Stories"]
    private var comics: [MarvelDetailItem]?
    private var stories: [MarvelDetailItem]?
    private var series: [MarvelDetailItem]?
    
    private let defaultCellIdentifier = "cell"
    private let descriptionCellIdentifier = "MarvelCharacterDetailsTableViewCell"
    
    
    // MARK: - Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        tableView.register(UINib(nibName: descriptionCellIdentifier, bundle: nil), forCellReuseIdentifier: descriptionCellIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: defaultCellIdentifier)
        
        comics = presenter.getCharacterDetails(section: .comics)
        series = presenter.getCharacterDetails(section: .series)
        stories = presenter.getCharacterDetails(section: .stories)
    }

}

extension MarvelCharacterDetailsViewController: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: descriptionCellIdentifier, for: indexPath) as? MarvelCharacterDetailsTableViewCell else {
                return UITableViewCell()
            }
            
            let charcater = presenter.getCharacter()
            var imageUrl = ""
            if let path = charcater.thumbnail?.path,
               let ext = charcater.thumbnail?.thumbnailExtension {
                imageUrl = "\(path).\(ext)"
            }
            
            cell.configureCell(url: imageUrl, title: charcater.name, description: charcater.description)
            
            return cell
        } else {
            let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier) else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: defaultCellIdentifier)
                }
                return cell
            }()
            
            if indexPath.section == 1 {
                if let comic = comics?[indexPath.row] {
                    cell.textLabel?.text = comic.name
                    cell.detailTextLabel?.text = comic.type
                }
                
            } else if indexPath.section == 2 {
                if let series = series?[indexPath.row] {
                    cell.textLabel?.text = series.name
                    cell.detailTextLabel?.text = series.type
                }
               
            } else {
                if let story = stories?[indexPath.row] {
                    cell.textLabel?.text = story.name
                    cell.detailTextLabel?.text = story.type
                }
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = sectionsTitle[section]
            label.font = .systemFont(ofSize: 16)
            label.textColor = .black
            
            headerView.addSubview(label)
            
            return headerView
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
     }
}

extension MarvelCharacterDetailsViewController: MarvelCharacterDetailsViewProtocol {
    
}
