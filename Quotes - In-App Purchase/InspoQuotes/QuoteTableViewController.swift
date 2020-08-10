//
//  QuoteTableViewController.swift
//  InspoQuotes
//

//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import StoreKit

class QuoteTableViewController: UITableViewController, SKPaymentTransactionObserver {
    
    
    
    let productID = "product id from the app store connect - in app purhcases"
    
    var quotesToShow = [
        "Our greatest glory is not in never falling, but in rising every time we fall. — Confucius",
        "All our dreams can come true, if we have the courage to pursue them. – Walt Disney",
        "It does not matter how slowly you go as long as you do not stop. – Confucius",
        "Everything you’ve ever wanted is on the other side of fear. — George Addair",
        "Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
        "Hardships often prepare ordinary people for an extraordinary destiny. – C.S. Lewis"
    ]
    
    let premiumQuotes = [
        "Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine. ― Roy T. Bennett",
        "I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear. – Nelson Mandela",
        "There is only one thing that makes a dream impossible to achieve: the fear of failure. ― Paulo Coelho",
        "It’s not whether you get knocked down. It’s whether you get up. – Vince Lombardi",
        "Your true success in life begins only when you make the commitment to become excellent at what you do. — Brian Tracy",
        "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going. – Chantal Sutherland"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)
        
        //if already purchased immediately show premiumQuotes()
        if isPurchased(){
            showPremiumQuoutes()
        }
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isPurchased(){
            return quotesToShow.count
        }else{
            return quotesToShow.count + 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)
        
        if indexPath.row < quotesToShow.count {
            cell.textLabel?.text = quotesToShow[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            cell.accessoryType = .none
        }else {
            cell.textLabel?.text = "More quotes?"
            cell.textLabel?.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.row == quotesToShow.count {
            buyPremiumQuotes()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - in app purchase method
    
    func buyPremiumQuotes() {
        
        //check if the user is allowed to make payments
        if SKPaymentQueue.canMakePayments(){
            
            //make i  app purhcase requst
            //all the code needed for in order to implement in app purchase
            
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
            
        }else{
            print("Sorry user cant make payments")
        }
        
    }
    
    //triggered when transaction status changes
    //transcations: [SKPaymentTransaction] ---array of all cases of transactions
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        //loop trough array of transactions
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                
                //payment successful
                print("transaction successful")
                
                showPremiumQuoutes()
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            }else if transaction.transactionState == .failed {
                
                //payment failed
                if let error = transaction.error {
                    let errorDescription = error.localizedDescription
                    print("transaction failed because of error \(errorDescription)")
                }
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            }else if transaction.transactionState == .restored {
                
                showPremiumQuoutes()
                
                print("transcation restored")
                
                //hide restore button when restored
                navigationItem.setRightBarButton(nil, animated: true)
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            }
        }
        
    }
    
    func showPremiumQuoutes() {
        
        //create user default for product id to check if purchased
        UserDefaults.standard.set(true, forKey: "productID")
        
        quotesToShow.append(contentsOf: premiumQuotes)
        tableView.reloadData()
    }
    
    //check if user purchased content
    func isPurchased() ->Bool{
        
        let purchaseStatus = UserDefaults.standard.bool(forKey: productID)
        
        if purchaseStatus {
            print("already purchased")
            return true
        }else {
            print("not pruchased")
            return false
        }
        
    }
    
    
    //restore purchase content when chaning device or reinstalling app
    @IBAction func restorePressed(_ sender: UIBarButtonItem) {
        
        SKPaymentQueue.default().restoreCompletedTransactions()
        
    }
    
    
}
