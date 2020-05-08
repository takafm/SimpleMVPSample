//
//  SampleViewController.swift
//  MVPSimpleSample
//
//  Created by Takafumi Oyama on 2020/05/08.
//  Copyright © 2020 Takafumi Oyama. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!
    
    private var presenter: SamplePresenterInput! // Protocol準拠とすることで、Stabなどに代替が簡単にできる
    func inject(presenter: SamplePresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Presenterへ処理移譲
    @IBAction func countButtonTapped(_ sender: Any) {
        self.presenter.countButtonTapped()
    }
}

// Presenterからのコールバック
extension SampleViewController: SamplePresenterOutput {
    func updateCounts(_ count: Int) {
        countLabel.text = "Count: \(count)"
    }
}
