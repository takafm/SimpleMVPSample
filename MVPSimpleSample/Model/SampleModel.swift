//
//  SampleModel.swift
//  MVPSimpleSample
//
//  Created by Takafumi Oyama on 2020/05/08.
//  Copyright © 2020 Takafumi Oyama. All rights reserved.
//

import Foundation

// Modelは単独で成り立つコンポーネントなので、Outputなどはない
protocol SampleModelInput {
    func countUp(completion: (_ count: Int) -> ())
}

final class SampleModel: SampleModelInput {
    var count = 0
    func countUp(completion: (_ count: Int) -> ()) {
        count = count + 1
        completion(count)
    }
}
