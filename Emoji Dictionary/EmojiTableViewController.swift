//
//  EmojiTableViewController.swift
//  Emoji Dictionary
//
//  Created by Student on 13/11/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis = [
        Emoji(symbol: "😀", name: "Смайлик", description: "Улыбающаяся мордочка", usage: ""),
        Emoji(symbol: "🤣", name: "Плач", description: "Плачущая мордочка", usage: ""),
        Emoji(symbol: "😍", name: "Сердечки", description: "Влюблённый смайлик", usage: ""),
        Emoji(symbol: "😎", name: "Крутой", description: "Смайлик в тёмных очках", usage: ""),
        Emoji(symbol: "🥶", name: "Синий", description: "Замёрзший смайлик", usage: ""),
        Emoji(symbol: "👁", name: "Глаз", description: "Карий глаз", usage: ""),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell

        let emoji = emojis[indexPath.row]
        cell.update(with: emoji)
        cell.showsReorderControl = true

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let emoji = emojis[indexPath.row]
//        print(#function, emoji.symbol, indexPath)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }


    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditEmojiTableViewController = navController.topViewController as! AddEditEmojiTableViewController
            addEditEmojiTableViewController.emoji = emoji
            addEditEmojiTableViewController.navigationItem.title = "Редактировать эмодзи"
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }

}
