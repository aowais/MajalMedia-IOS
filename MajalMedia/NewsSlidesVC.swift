//
//  NewsSlidesVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/6/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class NewsSlidesVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollViewNews: UIScrollView!
    var passedNews = [News]()
    var passedPosition = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewNews.delegate = self
        let slides:[Slide] = createSlide()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = passedPosition
        print("tell me what the count of the news passed:\(passedNews.count)")
        print("position:\(passedPosition)")
    }
    
    func createSlide() -> [Slide]{
        
        var slides = [Slide]()
        for item in passedNews{
            let slide:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            

//            slide.lbl_details.text = item.details
            
            slide.lbl_details.numberOfLines = 0
            slide.lbl_details.lineBreakMode = .byWordWrapping
            slide.lbl_details.text = item.details
            
            
//            slide.lbl_details.attributedText = stringFromHtml(string: item.details)
//            slide.lbl_details.setHTML(html: item.details)
            
            slide.lbl_title.text = item.title
            
            slides.append(slide)
        }
//        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//        slide1.lbl_title.text = "Slide1"
//        
//        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
//        slide2.lbl_title.text = "Slide2"
        
        return slides
    }
    
    private func stringFromHtml(string: String) -> NSAttributedString? {
        do {
            let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
            if let d = data {
                let str = try NSAttributedString(data: d,
                                                 options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                                                 documentAttributes: nil)
                return str
            }
        } catch {
        }
        return nil
    }
    
    
    func setupSlideScrollView(slides: [Slide]){
        scrollViewNews.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
//        let subViews = self.scrollViewNews.subviews
//        for subview in subViews{
//            print("SubView:\(subview.frame.size)")
//        }
//        
        scrollViewNews.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        
        
        scrollViewNews.isPagingEnabled = true
        for i in 0..<slides.count{
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollViewNews.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollViewNews.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

extension UILabel {
    func setHTML(html: String) {
        do {
            let at : NSAttributedString = try NSAttributedString(data: html.data(using: .utf8)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil);
            self.attributedText = at;
        } catch {
            self.text = html;
        }
    }
}
