//
//  SettingsGeneral.swift
//  Slide for Reddit
//
//  Created by Carlos Crane on 6/17/17.
//  Copyright © 2017 Haptic Apps. All rights reserved.
//

import UIKit
import reddift
import XLActionController

class SettingsLayout: UITableViewController {
    
    var cropBigPicCell: UITableViewCell = UITableViewCell()
    var cropBigPic = UISwitch()
    
    var hideBannerImageCell: UITableViewCell = UITableViewCell()
    var hideBannerImage = UISwitch()
    
    var cardModeCell: UITableViewCell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "mode")

    var hideActionbarCell: UITableViewCell = UITableViewCell()
    var hideActionbar = UISwitch()

    var largerThumbnailCell: UITableViewCell = UITableViewCell()
    var largerThumbnail = UISwitch()
    
    var scoreTitleCell: UITableViewCell = UITableViewCell()
    var scoreTitle = UISwitch()

    var abbreviateScoreCell: UITableViewCell = UITableViewCell()
    var abbreviateScore = UISwitch()

    var domainInfoCell: UITableViewCell = UITableViewCell()
    var domainInfo = UISwitch()

    var leftThumbCell: UITableViewCell = UITableViewCell()
    var leftThumb = UISwitch()

    var hideCell: UITableViewCell = UITableViewCell()
    var hide = UISwitch()

    var saveCell: UITableViewCell = UITableViewCell()
    var save = UISwitch()

    var selftextCell: UITableViewCell = UITableViewCell()
    var selftext = UISwitch()

    var smalltagCell: UITableViewCell = UITableViewCell()
    var smalltag = UISwitch()
    
    var linkCell = UITableViewCell()


    var link = LinkCellView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = ColorUtil.getColorForSub(sub: "")
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func switchIsChanged(_ changed: UISwitch) {
        if(changed == cropBigPic){
            SettingValues.bigPicCropped = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_cropBigPic)
        } else if(changed == hideBannerImage){
            SettingValues.bannerHidden = changed.isOn
            SubredditReorderViewController.changed = true
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_bannerHidden)
        } else if(changed == smalltag){
            SettingValues.smallerTag = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_smallTag)
        } else if(changed == hideActionbar){
            SettingValues.hideButtonActionbar = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_hideButtonActionbar)
        } else if(changed == selftext){
            SettingValues.showFirstParagraph = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_showFirstParagraph)
        } else if(changed == largerThumbnail){
            SettingValues.largerThumbnail = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_largerThumbnail)
        } else if(changed == abbreviateScore){
            SettingValues.abbreviateScores = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_abbreviateScores)
        } else if(changed == scoreTitle){
            SettingValues.scoreInTitle = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_scoreInTitle)
        } else if(changed == domainInfo){
            SettingValues.domainInInfo = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_domainInInfo)
        } else if(changed == leftThumb){
            SettingValues.leftThumbnail = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_leftThumbnail)
        } else if(changed == hide){
            SettingValues.hideButton = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_hideButton)
        } else if(changed == save){
            SettingValues.saveButton = changed.isOn
            UserDefaults.standard.set(changed.isOn, forKey: SettingValues.pref_saveButton)
        }
        UserDefaults.standard.synchronize()
        doDisables()
        doLink()
        tableView.reloadData()
    }
    
    func doLink(){
        link.contentView.removeFromSuperview()
        link = LinkCellView.init(frame: CGRect.init(x: 0, y: 0, width: self.tableView.frame.size.width, height: 500))
        
        let fakesub = RSubmission.init()
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let now: NSDate! = NSDate()
        
        let date0 = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: now as Date, options: NSCalendar.Options.matchFirst)!
        
        fakesub.id = "234"
        fakesub.name = "234"
        fakesub.author = "ccrama"
        fakesub.created = date0 as NSDate
        fakesub.edited = NSDate(timeIntervalSince1970: 1)
        fakesub.gilded = 0
        fakesub.htmlBody = ""
        fakesub.body = ""
        fakesub.title = "Chameleons are cool!"
        fakesub.subreddit = "all"
        fakesub.archived = false
        fakesub.locked = false
        fakesub.urlString = "http://i.imgur.com/mAs9Lk3.png"
        fakesub.distinguished = ""
        fakesub.isEdited = false
        fakesub.commentCount = 42
        fakesub.saved = false
        fakesub.stickied = false
        fakesub.visited = false
        fakesub.isSelf = false
        fakesub.permalink = ""
        fakesub.bannerUrl = "http://i.imgur.com/mAs9Lk3.png"
        fakesub.thumbnailUrl = "http://i.imgur.com/mAs9Lk3s.png"
        fakesub.lqUrl = "http://i.imgur.com/mAs9Lk3m.png"
        fakesub.lQ = false
        fakesub.thumbnail = true
        fakesub.banner = true
        fakesub.score = 52314
        fakesub.flair = "Cool!"
        fakesub.domain = "imgur.com"
        fakesub.voted = false
        fakesub.height = 288
        fakesub.width = 636
        fakesub.vote = false
        
        link.aspectWidth = self.tableView.frame.size.width
        self.link.setLink(submission: fakesub, parent: MediaViewController(), nav: nil, baseSub: "all", test: true)
        self.link.isUserInteractionEnabled = false
        linkCell.contentView.backgroundColor = ColorUtil.backgroundColor
        link.contentView.frame = CGRect.init(x: 0, y: 0, width: self.tableView.frame.size.width, height: link.estimateHeight(false, true))
        link.updateConstraints()
        link.doConstraints()
        linkCell.contentView.addSubview(link.contentView)
        linkCell.frame = CGRect.init(x: 0, y: 0, width: self.tableView.frame.size.width, height: link.estimateHeight(false, true))
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label : UILabel = UILabel()
        label.textColor = ColorUtil.baseAccent
        label.font = FontGenerator.boldFontOfSize(size: 20, submission: true)
        let toReturn = label.withPadding(padding: UIEdgeInsets.init(top: 0, left: 12, bottom: 0, right: 0))
        toReturn.backgroundColor = ColorUtil.backgroundColor
        
        switch(section) {
        case 0: label.text  = "Preview"
            break
        case 1: label.text  = "Display"
            break
        case 2: label.text = "Actionbar"
            break
        default: label.text  = ""
            break
        }
        return toReturn
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.section == 1 && indexPath.row == 0){
            let alertController: BottomSheetActionController = BottomSheetActionController()
            alertController.addAction(Action(ActionData(title: "List view", image: UIImage(named: "list")!.menuIcon()), style: .default, handler: { action in
                UserDefaults.standard.set("list", forKey: SettingValues.pref_postViewMode)
                SettingValues.postViewMode = .LIST
                UserDefaults.standard.synchronize()
                self.doDisables()
                self.doLink()
                tableView.reloadData()
                self.cardModeCell.detailTextLabel?.text = SettingValues.postViewMode.rawValue.capitalize()
                SubredditReorderViewController.changed = true
            }))
            
            alertController.addAction(Action(ActionData(title: "Card view", image: UIImage(named: "card")!.menuIcon()), style: .default, handler: { action in
                UserDefaults.standard.set("card", forKey: SettingValues.pref_postViewMode)
                SettingValues.postViewMode = .CARD
                UserDefaults.standard.synchronize()
                self.doDisables()
                self.doLink()
                tableView.reloadData()
                self.cardModeCell.detailTextLabel?.text = SettingValues.postViewMode.rawValue.capitalize()
                SubredditReorderViewController.changed = true
            }))
            
            alertController.addAction(Action(ActionData(title: "Centered card view", image: UIImage(named: "centeredimage")!.menuIcon()), style: .default, handler: { action in
                UserDefaults.standard.set("center", forKey: SettingValues.pref_postViewMode)
                SettingValues.postViewMode = .CENTER
                UserDefaults.standard.synchronize()
                self.doDisables()
                self.doLink()
                tableView.reloadData()
                self.cardModeCell.detailTextLabel?.text = SettingValues.postViewMode.rawValue.capitalize()
                SubredditReorderViewController.changed = true
            }))
                
            alertController.addAction(Action(ActionData(title: "Compact view", image: UIImage(named: "compact")!.menuIcon()), style: .default, handler: { action in
                UserDefaults.standard.set("compact", forKey: SettingValues.pref_postViewMode)
                SettingValues.postViewMode = .COMPACT
                UserDefaults.standard.synchronize()
                self.doDisables()
                self.doLink()
                tableView.reloadData()
                self.cardModeCell.detailTextLabel?.text = SettingValues.postViewMode.rawValue.capitalize()
                SubredditReorderViewController.changed = true
            }))
            
            VCPresenter.presentAlert(alertController, parentVC: self)

        }
    }
    
    public func createCell(_ cell: UITableViewCell, _ switchV: UISwitch? = nil, isOn: Bool, text: String){
        cell.textLabel?.text = text
        cell.textLabel?.textColor = ColorUtil.fontColor
        cell.backgroundColor = ColorUtil.foregroundColor
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        if let s = switchV {
            s.isOn = isOn
            s.addTarget(self, action: #selector(SettingsLayout.switchIsChanged(_:)), for: UIControlEvents.valueChanged)
            cell.accessoryView = s
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    override func loadView() {
        super.loadView()
        doLink()
        self.view.backgroundColor = ColorUtil.backgroundColor
        // set the title
        self.title = "General"
        self.tableView.separatorStyle = .none

        createCell(cropBigPicCell, cropBigPic, isOn: SettingValues.bigPicCropped, text: "Crop big pic")
        createCell(hideBannerImageCell, hideBannerImage, isOn: SettingValues.bannerHidden, text: "Hide banner image")
        createCell(selftextCell, selftext, isOn: SettingValues.showFirstParagraph, text: "Show selftext preview")
        createCell(cardModeCell, isOn: SettingValues.bigPicCropped, text: "Layout mode")
        cardModeCell.detailTextLabel?.textColor = ColorUtil.fontColor
        cardModeCell.detailTextLabel?.text = SettingValues.postViewMode.rawValue.capitalize()
        cardModeCell.detailTextLabel?.numberOfLines = 0
        cardModeCell.detailTextLabel?.lineBreakMode = .byWordWrapping
        createCell(smalltagCell, smalltag, isOn: SettingValues.smallerTag, text: "Smaller content tag")
        createCell(hideActionbarCell, hideActionbar, isOn: SettingValues.hideButtonActionbar, text: "Hide actionbar")
        createCell(largerThumbnailCell, largerThumbnail, isOn: SettingValues.largerThumbnail, text: "Larger thumbnail")
        createCell(scoreTitleCell, scoreTitle, isOn: SettingValues.scoreInTitle, text: "Score and comment count in title")
        createCell(abbreviateScoreCell, abbreviateScore, isOn: SettingValues.abbreviateScores, text: "Abbreviate post scores (ex: 10k)")
        createCell(domainInfoCell, domainInfo, isOn: SettingValues.domainInInfo, text: "Show domain in info line")
        createCell(leftThumbCell, leftThumb, isOn: SettingValues.leftThumbnail, text: "Thumbnail on left side")
        createCell(hideCell, hide, isOn: SettingValues.hideButton, text: "Show hide post button")
        createCell(saveCell, save, isOn: SettingValues.saveButton, text: "Show save button")
        
        doDisables()
        self.tableView.tableFooterView = UIView()

    }
    
    func doDisables(){
        if(SettingValues.bannerHidden){
            cropBigPic.isEnabled = false
        } else {
            cropBigPic.isEnabled = true
        }
        if(SettingValues.hideButtonActionbar){
            hide.isEnabled = false
            save.isEnabled = false
        } else {
            hide.isEnabled = true
            save.isEnabled = true
        }
    
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0){
            return 0
        }
        return 70
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return link.estimateHeight(false)
        }
        return 60
    }
    
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
          return linkCell
        case 1:
            switch(indexPath.row) {
            case 0: return self.cardModeCell
            case 1: return self.hideBannerImageCell
            case 2: return self.cropBigPicCell
            case 3: return self.largerThumbnailCell
            case 4: return self.leftThumbCell
            case 5: return self.selftextCell
            case 6: return self.smalltagCell

            default: fatalError("Unknown row in section 0")
            }
        case 2:
            switch(indexPath.row) {
            case 0: return self.hideActionbarCell
            case 1: return self.scoreTitleCell
            case 2: return self.abbreviateScoreCell
            case 3: return self.domainInfoCell
            case 4: return self.hideCell
            case 5: return self.saveCell

            default: fatalError("Unknown row in section 0")
            }
        default: fatalError("Unknown section")
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 1
        case 1: return 7
        case 2: return 6
        default: fatalError("Unknown number of sections")
        }
    }
    
    
}
