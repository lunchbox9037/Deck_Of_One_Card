//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by stanley phillips on 1/26/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var cardValueSuitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        drawButton.layer.cornerRadius = 8
        cardImageView.image = UIImage(named: "cardback")
    }
    
    // MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        cardImageView.image = UIImage(named: "cardback")
        cardValueSuitLabel.text = "Shuffling..."
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
            CardController.fetchCard { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let card):
                        self.fetchImageAndUpdateViews(for: card)
                    case .failure(let error):
                        self.presentErrorToUser(localizedError: error)
                    }
                }
            }
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        cardImageView.image = UIImage(named: "cardback")
        cardValueSuitLabel.text = "Draw a Card!"
    }
    
    // MARK: - Helper Functions
    func fetchImageAndUpdateViews(for card: Card) {
        CardController.fetchImage(for: card) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.cardValueSuitLabel.text = "\(card.value) of \(card.suit)"
                    self.cardImageView.image = image
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}//end of class
