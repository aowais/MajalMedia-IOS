//
//  TestContentVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/8/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class TestContentVC: UIViewController {
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var lbl_details: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var img_room: UIImageView!
    @IBOutlet weak var lbl_room: UILabel!
    @IBOutlet weak var lbl_date: UILabel!
    
//    @IBOutlet weak var webview: UIWebView!
    var dataObject: AnyObject?
    var item: News?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad:\(String(describing: item?.title))")
        lbl_details.text = item?.details
        updateViewConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear:\(String(describing: item?.title))")
//        webview.loadHTMLString(dataObject as! String, baseURL: NSURL(string: "")! as URL)
//        lbl_details.text = dataObject as? String
//        let str = item?.details.html2AttributedString
        lbl_details.text = item?.details
//        lbl_details.attributedText = str
        lbl_title.text = item?.title
        lbl_room.text = item?.page_name
        lbl_date.text = item?.created_date
//        lbl_details.isUserInteractionEnabled = false
        
        let detailsH = lbl_details.bounds.size.height
        
        print("detailsH:\(detailsH)")
        
        let image = UIImage(named: "ic_placeholder")
        
        let url = URL(string: (item?.main_img)!)
        mainImage.kf.setImage(with: url,placeholder: image)
        
        let urlimg_room = URL(string: (item?.page_logo)!)
        img_room.kf.setImage(with: urlimg_room,placeholder: image)
        
        
        scrollview.contentSize = CGSize.init(width: scrollview.frame.size.width, height: scrollview.frame.size.height+detailsH)
        scrollview.isScrollEnabled = true
    }
    
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        //
//    }
    
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews\(String(describing: item?.title))")
        let detailsH = lbl_details.bounds.size.height
        scrollview.contentSize = CGSize.init(width: scrollview.frame.size.width, height: scrollview.frame.size.height+detailsH)
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews\(String(describing: item?.title))")
        let detailsH = lbl_details.bounds.size.height
        scrollview.contentSize = CGSize.init(width: scrollview.frame.size.width, height: scrollview.frame.size.height+detailsH)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        webview.loadHTMLString(dataObject as! String,
//                               baseURL: NSURL(string: "") as! URL)
//    }
    

}


extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
