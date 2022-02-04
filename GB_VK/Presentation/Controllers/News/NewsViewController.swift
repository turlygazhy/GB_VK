//
//  NewsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 03.02.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [
        NewsItem(userAva: UIImage(named: "h1")!, username: "some name", postText: "fkdjsfkjdksfjkdsljfkdsjkl", postPicture: UIImage(named: "h2")!, likeCount: 532, commentCount: 120, repostCount: 60, viewCount: 2000),
        NewsItem(userAva: UIImage(named: "g3")!, username: "any any", postText: "fkdjsfkjdksfjkdsfdasfdsafdsfsdafdsafdsafljfkdsjkl", postPicture: UIImage(named: "g1")!, likeCount: 574, commentCount: 850, repostCount: 90, viewCount: 3500)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 2
        let newsItem = dataSource[section]
        if newsItem.postText != nil {
            numberOfRow = numberOfRow + 1
        }
        if newsItem.postPicture != nil {
            numberOfRow = numberOfRow + 1
        }
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsItem = dataSource[indexPath.section]
        let row = indexPath.row
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            cell.userAva.image = newsItem.userAva
            cell.username.text = newsItem.username
            return cell
        }
        if row == 1 {//todo handle case when no text or no photo
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! PostTextTableViewCell
            cell.postText.text = newsItem.postText
            return cell
        }
        if row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! PostPhotoTableViewCell
            cell.postPhoto.image = newsItem.postPicture
            return cell
        }
        if row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) as! StatisticTableViewCell
            cell.likeCount.text = newsItem.likeCount.description
            cell.commentCount.text = newsItem.commentCount.description
            cell.repostCount.text = newsItem.repostCount.description
            cell.viewCount.text = newsItem.viewCount.description
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        view.backgroundColor = .darkGray
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 200
        }
        return 50
    }
}
