//
//  HomeViewController.swift
//  Buoi11
//
//  Created by Việt Anh Trần on 22/4/25.
//

import UIKit

class HomeViewController:UIViewController{
 
    
    

    @IBOutlet weak var tableView: UITableView!
    var listClubs: [String] = ["Arts & Culture", "Career & Business", "Cars & Motorcycles", "Community & Environment", "Dancing", "Education & Learning", "Fashion & Beauty", "Fitness", "Food & Drink", "Games", "LGBT", "Movements & Politics", "Health & Wellbeing", "Hobbies & Crafts", "Language & Ethnic Identity", "Lifestyle", "Book Clubs"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ClubCell", bundle: Bundle.main), forCellReuseIdentifier: "ClubCell")
        
        
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - Table view data source and delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listClubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClubCell") as? ClubCell else {
            return UITableViewCell()
        }
        cell.bindData(name: listClubs[indexPath.row], image: "\(indexPath.row)")
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

