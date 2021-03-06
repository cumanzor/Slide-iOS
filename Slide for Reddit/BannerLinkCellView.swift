//
//  BannerLinkCellView.swift
//  Slide for Reddit
//
//  Created by Carlos Crane on 6/25/17.
//  Copyright © 2017 Haptic Apps. All rights reserved.
//

import UIKit

class BannerLinkCellView: LinkCellView {
    
    override func doConstraints() {
        let target = CurrentType.banner
        
        if(currentType == target && target != .banner){
            return //work is already done
        }
        
        if(currentType == target && target == .banner && bigConstraint != nil){
            self.contentView.addConstraint(bigConstraint!)
            return
        }
        
        let metrics=["horizontalMargin":75,"top":0,"bottom":0,"separationBetweenLabels":0,"size": full ? 16 : 8, "labelMinHeight":75, "ctwelve": SettingValues.postViewMode == .COMPACT ? 8 : 12,"ceight": SettingValues.postViewMode == .COMPACT ? 4 : 8, "bannerPadding": (full || SettingValues.postViewMode != .CARD) ? 5 : 0, "thumb": (SettingValues.largerThumbnail ? 75 : 50), "bannerHeight": submissionHeight] as [String: Int]
        let views=["label":title, "body": textView, "image": thumbImage, "info": b, "tag" : tagbody, "upvote": upvote, "downvote" : downvote, "score": score, "comments": comments, "banner": bannerImage, "buttons":buttons, "box": box] as [String : Any]
        var bt = "[buttons]-(ceight)-"
        var bx = "[box]-(ceight)-"
        if(SettingValues.hideButtonActionbar && !full){
            bt = "[buttons(0)]-4-"
            bx = "[box(0)]-4-"
        }
        
        self.contentView.removeConstraints(thumbConstraint)
        thumbConstraint = []
        
        thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(0)]",
                                                                          options: NSLayoutFormatOptions(rawValue: 0),
                                                                          metrics: metrics,
                                                                          views: views))
        thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(ctwelve)-[label]-(ctwelve)-|",
                                                                          options: NSLayoutFormatOptions(rawValue: 0),
                                                                          metrics: metrics,
                                                                          views: views))
        if(SettingValues.postViewMode == .CENTER || full){
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-(ceight)-[label]-(ceight)-[banner]-(ctwelve)-\(bx)|",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: metrics,
                views: views))
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[info]-[banner]",
                                                                              options: NSLayoutFormatOptions.alignAllLastBaseline,
                                                                              metrics: metrics,
                                                                              views: views))
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[banner]-[tag]",
                                                                              options: NSLayoutFormatOptions.alignAllLastBaseline,
                                                                              metrics: metrics,
                                                                              views: views))
            
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[info(45)]-(ceight)-[buttons]",
                                                                              options: NSLayoutFormatOptions(rawValue: 0),
                                                                              metrics: metrics,
                                                                              views: views))
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[tag]-(ctwelve)-[buttons]",
                                                                              options: NSLayoutFormatOptions(rawValue: 0),
                                                                              metrics: metrics,
                                                                              views: views))
            
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[info]-(ceight)-[box]",
                                                                              options: NSLayoutFormatOptions(rawValue: 0),
                                                                              metrics: metrics,
                                                                              views: views))
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[tag]-(ctwelve)-[box]",
                                                                              options: NSLayoutFormatOptions(rawValue: 0),
                                                                              metrics: metrics,
                                                                              views: views))
            
            
        } else {
            
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-(bannerPadding)-[banner]-(ceight)-[label]-(ctwelve)-\(bx)|",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: metrics,
                views: views))
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[info(45)]-(ceight)-[label]",
                                                                              options: NSLayoutFormatOptions(rawValue: 0),
                                                                              metrics: metrics,
                                                                              views: views))
            
            thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[tag]-(ctwelve)-[label]",
                                                                              options: NSLayoutFormatOptions(rawValue: 0),
                                                                              metrics: metrics,
                                                                              views: views))
            
        }
        
        thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:\(bt)|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metrics,
            views: views))
        thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:\(bx)|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metrics,
            views: views))
        
        thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(bannerPadding)-[banner]-(bannerPadding)-|",
                                                                          options: NSLayoutFormatOptions(rawValue: 0),
                                                                          metrics: metrics,
                                                                          views: views))
        thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(bannerPadding)-[info]-(bannerPadding)-|",
                                                                          options: NSLayoutFormatOptions(rawValue: 0),
                                                                          metrics: metrics,
                                                                          views: views))
        thumbConstraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[tag]-(ctwelve)-|",
                                                                          options: NSLayoutFormatOptions(rawValue: 0),
                                                                          metrics: metrics,
                                                                          views: views))
        
        self.contentView.addConstraints(thumbConstraint)
        currentType = target
        if( target == .banner && bigConstraint != nil){
            self.contentView.addConstraint(bigConstraint!)
            return
        }
        
    }
    
}
