//
//  NewsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 03.02.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [NewsItem]()
    var profiles = [User]()
    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        NetworkManager.initNews(controller: self)
    }
    
    func setNewsItems(newsItems: [NewsItem]) {
        DispatchQueue.main.async {
            self.dataSource = newsItems
            self.tableView.reloadData()
        }
    }
    
    func setNewsProfiles(profiles: [User]) {
        self.profiles = profiles
    }
    
    func setGroups(groups: [Group]) {
        self.groups = groups
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 2
        let newsItem = dataSource[section]
        if newsItem.getPostText() != nil {
            numberOfRow = numberOfRow + 1
        }
        if newsItem.getPostPictureUrl() != nil {
            numberOfRow = numberOfRow + 1
        }
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsItem = dataSource[indexPath.section]
        let row = indexPath.row
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            //            cell.userAva.image = newsItem.userAva todo
            cell.username.text = newsItem.getUserName()
            return cell
        }
        if row == 1 {//todo handle case when no text or no photo
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! PostTextTableViewCell
            cell.postText.text = newsItem.getPostText()
            return cell
        }
        if row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! PostPhotoTableViewCell
            //            cell.postPhoto.image = UIImage(data: Data()) newsItem.getPostPictureUrl() //todo
            return cell
        }
        if row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) as! StatisticTableViewCell
            cell.likeCount.text = newsItem.getLikesCount().description
            cell.commentCount.text = newsItem.getCommentsCount().description
            cell.repostCount.text = newsItem.getRepostsCount().description
            cell.viewCount.text = newsItem.getViewsCount().description
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
