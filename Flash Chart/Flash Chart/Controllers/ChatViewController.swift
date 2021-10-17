//
//  ChartViewViewController.swift
//  Flash Chart
//
//  Created by niBVL on 14/10/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tabView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    var messages:[MessageModel] = []
    var db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title  = K.appName
        navigationItem.hidesBackButton = true
        tabView.dataSource = self
        tabView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
        listenerMessage()
    }
    
    func listenerMessage()  {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .limit(toLast: 1)
            .addSnapshotListener() { querySnapshot, error in
                if let safeError = error {
                    print("-------------------------")
                    print(safeError)
                    print("-------------------------")
                }
                else {
                    if let safeDocuments = querySnapshot?.documents {
                        for snapshot in safeDocuments {
                            if let safeBodyMessage = snapshot.get(K.FStore.bodyField) as? String, let safeSender = snapshot.get(K.FStore.senderField) as? String {
                                self.messages.append(MessageModel(body: safeBodyMessage, sender: safeSender, time: Int(truncating: snapshot.get(K.FStore.dateField) as! NSNumber)))
                            }
                        }
                        if !self.messages.isEmpty {
                            DispatchQueue.main.async {
                                self.tabView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tabView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }

                    }
                }
            }
    }
    
    
    func loadMessages()  {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .getDocuments() { querySnapshot, error in
            self.messages = []
            if let safeError = error {
                print("-------------------------")
                print(safeError)
                print("-------------------------")
            }
            else {
                if let safeDocuments = querySnapshot?.documents {
                    for snapshot in safeDocuments {
                        if let safeBodyMessage = snapshot.get(K.FStore.bodyField) as? String, let safeSender = snapshot.get(K.FStore.senderField) as? String {
                            self.messages.append(MessageModel(body: safeBodyMessage, sender: safeSender, time: Int(truncating: snapshot.get(K.FStore.dateField) as! NSNumber)))
                        }
                    }
                    print(self.messages)
                    if !self.messages.isEmpty {
                        DispatchQueue.main.async {
                            self.tabView.reloadData()
                            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                            self.tabView.scrollToRow(at: indexPath, at: .top, animated: true)
                        }
                    }
                    
                }
            }
        }
    }
    
    @IBAction func sendOnTap(_ sender: UIButton) {
        if let safeMessage = messageTextField.text, let safeSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName)
                .addDocument(data: [K.FStore.senderField: safeSender, K.FStore.bodyField: safeMessage, K.FStore.dateField: Int(Date().timeIntervalSince1970)]) { error in
                    if let safeError = error {
                        print(safeError)
                    }
                    else {
                        self.messageTextField.text = ""
                    }
                }
        }
    }
    
    @IBAction func logoutOnTap(_ sender: UIBarButtonItem) {
        let firebaseAuth =  Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing: \(signOutError)")
        }
    }
    
    
}
//MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        let messageModel = messages[indexPath.row]
        cell.messageLabel.text = messageModel.body
        if messageModel.sender == Auth.auth().currentUser?.email {
            cell.avatarYouImage.isHidden = true
            cell.avatarMeImage.isHidden = false
            cell.messageBuble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        else {
            cell.avatarYouImage.isHidden = false
            cell.avatarMeImage.isHidden = true
            cell.messageBuble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.purple)
        }
        return cell
    }
    
    
}
