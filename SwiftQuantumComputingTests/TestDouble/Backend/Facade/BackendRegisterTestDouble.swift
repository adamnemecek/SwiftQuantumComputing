//
//  BackendRegisterTestDouble.swift
//  SwiftQuantumComputing
//
//  Created by Enrique de la Torre on 20/12/2018.
//  Copyright © 2018 Enrique de la Torre. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

@testable import SwiftQuantumComputing

// MARK: - Main body

final class BackendRegisterTestDouble {

    // MARK: - Internal properties

    private (set) var applyingCount = 0
    private (set) var lastApplyingGate: RegisterGate?
    var applyingResult: BackendRegisterTestDouble?

    private (set) var measureCount = 0
    private (set) var lastMeasureQubits: [Int]?
    var measureResult: [Double]?
}

// MARK: - BackendRegister methods

extension BackendRegisterTestDouble: BackendRegister {
    func applying(_ gate: RegisterGate) -> BackendRegisterTestDouble? {
        applyingCount += 1

        lastApplyingGate = gate

        return applyingResult
    }

    func measure(qubits: [Int]) -> [Double]? {
        measureCount += 1

        lastMeasureQubits = qubits

        return measureResult
    }
}
