//
//  SamplePresenter.swift
//  MVPSimpleSample
//
//  Created by Takafumi Oyama on 2020/05/08.
//  Copyright © 2020 Takafumi Oyama. All rights reserved.
//

import Foundation

// Input: Presenterに伝える
protocol SamplePresenterInput {
    func countButtonTapped()
}

// Output: Presenterからのコールバック（Viewへの描画指示）
protocol SamplePresenterOutput: AnyObject {
    func updateCounts(_ count: Int)
}

final class SamplePresenter: SamplePresenterInput {
    private weak var view: SamplePresenterOutput! // viewを弱参照でもつ
    private var model: SampleModelInput // Protocol準拠とすることで、Stabなどに代替が簡単にできる
    
    init(view: SamplePresenterOutput, model: SampleModelInput) {
        self.view = view
        self.model = model
    }
    
    // Modelへ処理移譲
    func countButtonTapped() {
        self.model.countUp{ newCount in
            view.updateCounts(newCount)
        }
    }
}
