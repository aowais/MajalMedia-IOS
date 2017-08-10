//
//  TestContentVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/8/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class TestContentVC: UIViewController {
//    
//    public enum HTMLNodeType : String {
//        case HTMLUnkownNode     = ""
//        case HTMLHrefNode       = "href"
//        case HTMLTextNode       = "text"
//        case HTMLCodeNode       = "code"
//        case HTMLSpanNode       = "span"
//        case HTMLPNode          = "p"
//        case HTMLLiNode         = "li"
//        case HTMLUiNode         = "ui"
//        case HTMLImageNode      = "image"
//        case HTMLOlNode         = "ol"
//        case HTMLStrongNode     = "strong"
//        case HTMLPreNode        = "pre"
//        case HTMLBlockQuoteNode = "blockquote"
//    }
    
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
        let nid = item?.nid
        print("viewDidLoad:\(String(describing: item?.title))")
//        lbl_details.text = item?.details
        let detailsH = lbl_details.bounds.size.height
        let totalHeight = self.scrollview.frame.size.height+detailsH
        print("viewDidLoad totalHeight:\(totalHeight)")
        scrollview.contentSize = CGSize.init(width: scrollview.frame.size.width, height: totalHeight) // is a must here
//        print("viewDidLoad detailsH:\(detailsH) nid:\(String(describing: nid))")
//        updateViewConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let nid = item?.nid
        print("viewWillAppear:\(String(describing: item?.title))")
//        webview.loadHTMLString(dataObject as! String, baseURL: NSURL(string: "")! as URL)
//        lbl_details.text = dataObject as? String
//        let str = item?.details.html2AttributedString
//        lbl_details.text = item?.details
//        lbl_details.attributedText = str
        lbl_title.text = item?.title
        lbl_room.text = item?.page_name
        lbl_date.text = item?.created_date
//        lbl_details.isUserInteractionEnabled = false
        var str :NSAttributedString?
        DispatchQueue.background(background: {
            // do something in background
           str = self.item?.details.html2AttributedString
        }, completion:{
            // when background job finished, do something in main thread
            self.lbl_details.attributedText = str
            self.lbl_details.textAlignment = NSTextAlignment.right
            self.lbl_details.contentMode = .scaleToFill
            self.lbl_details.font = UIFont.systemFont(ofSize: 15)
            self.lbl_details.adjustsFontSizeToFitWidth = true
            self.lbl_details.sizeToFit()
            let detailsH = self.lbl_details.bounds.size.height
            let totalHeight = self.scrollview.frame.size.height+detailsH
            print("totalHeight:\(totalHeight)")
            self.scrollview.contentSize = CGSize.init(width: self.scrollview.frame.size.width, height: totalHeight)
        })
        
        
        
        let detailsH = lbl_details.bounds.size.height
        let totalHeight = self.scrollview.frame.size.height+detailsH
        print("viewWillAppear totalHeight:\(totalHeight)")
//        print("viewWillAppear detailsH:\(detailsH) nid:\(String(describing: nid))")
        let image = UIImage(named: "ic_placeholder")
        
        let url = URL(string: (item?.main_img)!)
        mainImage.kf.setImage(with: url,placeholder: image)
        
        let urlimg_room = URL(string: (item?.page_logo)!)
        img_room.kf.setImage(with: urlimg_room,placeholder: image)
        
        
//        scrollview.contentSize = CGSize.init(width: scrollview.frame.size.width, height: scrollview.frame.size.height+detailsH)
//        scrollview.isScrollEnabled = true
    }
    
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        //
//    }
    
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews\(String(describing: item?.title))")
        let nid = item?.nid
//        lbl_details.text = item?.details
        let detailsH = lbl_details.bounds.size.height
        let totalHeight = self.scrollview.frame.size.height+detailsH
        print("viewDidLayoutSubviews totalHeight:\(totalHeight) nid:\(String(describing: nid))")
        scrollview.contentSize = CGSize.init(width: scrollview.frame.size.width, height: totalHeight)
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews\(String(describing: item?.title))")
        let nid = item?.nid
//        lbl_details.text = item?.details
        let detailsH = lbl_details.bounds.size.height
        let totalHeight = self.scrollview.frame.size.height+detailsH
        print("viewWillLayoutSubviews totalHeight:\(totalHeight) nid:\(String(describing: nid))")
        scrollview.contentSize = CGSize.init(width: scrollview.frame.size.width, height: scrollview.frame.size.height+detailsH)
    }

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


extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
}

extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        
        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}




//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        webview.loadHTMLString(dataObject as! String,
//                               baseURL: NSURL(string: "") as! URL)
//    }
