//
//  MainVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/3/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var loaderInd: UIActivityIndicatorView!
    var token = Token()
    var newsDetails = NewsDownload()
    var gmc = GlobalMethods()
    var localNews = [News]()
    var loadingData: Bool!
    var currentPage = 0
    @IBOutlet weak var segmentSort: UISegmentedControl!
//    var navigationBarAppearace = UINavigationBar.appearance()
   

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBarAppearace.tintColor = UIColor.white
//        navigationBarAppearace.barTintColor = UIColor(red: 1/255, green: 115/255, blue: 177/255, alpha: 1.0)
        
//        var _:UIBarButtonItem = UIBarButtonItem(title: "Filter", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MainVC.addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"filter"), style: .plain, target: self, action: #selector(showAlertButtonTapped))
        loadingData = false
        tableView.delegate = self
        tableView.dataSource = self
        loaderInd.startAnimating()
        loadMoreData()
        
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch segmentSort.selectedSegmentIndex {
        case 0:
            print("segment 1")
            filterByViews()
        case 1:
            print("segment 2")
            filterByTitle()
        case 2:
            print("segment 3")
            filterByDate()
        default:
            print("segment default")
        }
    }
    
    func filterByTitle() {
        print("B---------------------")
        print("----------------------")
        
        for v in localNews {
            print("v:\(v.title)")
        }
        localNews.sort { $0.title < $1.title }
        tableView.reloadData()
        tableView.setContentOffset(CGPoint.zero, animated: true)
        print("----------------------")
        for v in localNews {
            print("v:\(v.title)")
        }
        print("----------------------")
        print("---------------------E")
    }
    
    func filterByDate() {
        print("filterByDate:\(localNews.count)")
        localNews.sort { $0.nid > $1.nid }
        tableView.reloadData()
        tableView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func filterByViews() {
        print("filterByViews:\(localNews.count)")
        for v in localNews {
            print("v:\(v.view_count)")
        }
        print("----------------------")
//        $0.compare($1) == .OrderedDescending
        localNews.sort { $0.view_count > $1.view_count }
        tableView.reloadData()
        tableView.setContentOffset(CGPoint.zero, animated: true)
        for v in localNews {
            print("v:\(v.view_count)")
        }
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
        
        // create the alert
        let alert = UIAlertController(title: "ترتيب القائمة", message: "يمكنك ترتيب قائمة الاخبار حسب الخيارات التالية", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "حسب العنوان", style: UIAlertActionStyle.default, handler: { action in
            self.segmentSort.selectedSegmentIndex = 1
            self.filterByTitle()
        }))
        alert.addAction(UIAlertAction(title: "حسب المشاهدات", style: UIAlertActionStyle.default, handler: { action in
            self.segmentSort.selectedSegmentIndex = 0
            self.filterByViews()
        }))
        alert.addAction(UIAlertAction(title: "حسب التاريخ", style: UIAlertActionStyle.default, handler: { action in
            self.segmentSort.selectedSegmentIndex = 2
            self.filterByDate()
        }))
        alert.addAction(UIAlertAction(title: "الغاء", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func requestDownload(token: Int64, page: Int){
        print("page:\(page)")
        newsDetails.downloadNewsDetails(tok: token, page: page){news,SUCCESS in
            if SUCCESS!{
                print("download finished")
                for item in news!{
                    print("Adding news:\(item.title)")
                    self.localNews.append(item)
                }
                self.loadingData = false
                self.tableView.reloadData()
                self.loaderInd.isHidden = false
            }
            else{
                print("SplashVC token error")
            }
        }
    }
    

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = localNews.count - 1
        if !loadingData && indexPath.row == lastElement {
            print("ask to load")
            self.loaderInd.isHidden = false
            loadingData = true
            self.currentPage += 1
            loadMoreData()
        }
        else{
//            print("asd")
            //
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let items = localNews[indexPath.row]
        cell.updateUI(item: items)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localNews.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "NewsSlidesVC") as! NewsSlidesVC
//        myVC.passedNews = self.localNews
//        myVC.passedPosition = indexPath.row
//        print("myVC.passedNews:count before sending:\(myVC.passedNews.count)")
////        performSegue(withIdentifier: "NewsSlidesVC", sender: myVC)
//        navigationController?.pushViewController(myVC, animated: true)
        
        gotoTestVC(index: indexPath.row)
    }
    
    func gotoPager(){
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "PagerVC") as! PagerVC
//        myVC.passedNews = self.localNews
//        print("myVC.passedNews:count before sending:\(myVC.passedNews.count)")
//        navigationController?.pushViewController(myVC, animated: true)
        performSegue(withIdentifier: "PagerVC", sender: nil)
    }
    
    func gotoTestVC(index: Int){
        let myVC = storyboard?.instantiateViewController(withIdentifier: "testvc") as! TestVC
        myVC.passedNews = self.localNews
        myVC.passedPosition = index
        print("myVC.passedNews:count before sending:\(myVC.passedNews.count)")
        navigationController?.pushViewController(myVC, animated: true)
//         performSegue(withIdentifier: "testvc", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func loadMoreData(){
        print("loadMoreData")
        let storedTtl = token.getTtl()
        print("storedTtl: \(storedTtl)")
        let currentTime = gmc.getCurrentMillis()
        print("currentTime: \(currentTime)")
        if currentTime > storedTtl{
            token.downloadTokenDetails{ SUCCESS in
                if SUCCESS!{
                    print("download finished")
                    let storedToken = self.token.getToken()
                    self.requestDownload(token: storedToken,page: self.currentPage)
                }
                else{
                    print("SplashVC token error")
                }
            }
        }
        else{
            print("token within time")
            let storedToken = self.token.getToken()
            self.requestDownload(token: storedToken,page: self.currentPage)
        }
    }
    
    func parseDate(str: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: "01-01-2017") //according to date format your date string
        print(date ?? "") //Convert String to Date
        return date!
    }

}
