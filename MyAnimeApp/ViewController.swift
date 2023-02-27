//
//  ViewController.swift
//  MyAnimeApp
//
//  Created by EasyPOS iOS Dev on 2/27/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var characterAndTitleLabel: UILabel!
    
    let quoteService = QuoteService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getRandomQuote()
    }
    
    
}

extension ViewController {
    
    // MARK: MAIN FUNCTION! Call this on viewDidLoad.
    func getRandomQuote() {
        quoteService.getRandomQuote { quote, error in
            DispatchQueue.main.async {
                if error != nil {
                    self.showNoQuoteForToday()
                } else {
                    self.setupQuoteToDisplay(quote: quote)
                }
            }
        }
    }
    
    // MARK: Attaching data to the view
    func setupQuoteToDisplay(quote: Quote?) {
        if let quote = quote {
            quoteLabel.text = quote.quote ?? "No quote available for today."
            characterAndTitleLabel.text = "\(quote.character ?? "Unknown character") (\(quote.anime ?? "Unknown anime"))"
        } else {
            showNoQuoteForToday()
        }
    }
    
    func showNoQuoteForToday() {
        characterAndTitleLabel.isHidden = true
        quoteLabel.text = "No quote available for today."
    }
}

