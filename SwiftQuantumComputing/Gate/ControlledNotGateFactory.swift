//
//  ControlledNotGateFactory.swift
//  SwiftQuantumComputing
//
//  Created by Enrique de la Torre on 12/08/2018.
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

// MARK: - Main body

struct ControlledNotGateFactory {

    // MARK: - Private properties

    private let factory: GateFactory

    // MARK: - Init methods

    init?(qubitCount: Int) {
        let baseMatrix = Constants.baseCNot
        guard let factory = GateFactory(qubitCount: qubitCount, baseMatrix: baseMatrix) else {
            return nil
        }

        self.factory = factory
    }

    // MARK: - Public methods

    func makeGate(controlInput: Int, targetInput: Int) -> Gate? {
        return factory.makeGate(inputs: controlInput, targetInput)
    }
}

// MARK: - Private body

private extension ControlledNotGateFactory {

    // MARK: - Constants

    enum Constants {
        static let baseCNot = Matrix([[Complex(1), Complex(0), Complex(0), Complex(0)],
                                      [Complex(0), Complex(1), Complex(0), Complex(0)],
                                      [Complex(0), Complex(0), Complex(0), Complex(1)],
                                      [Complex(0), Complex(0), Complex(1), Complex(0)]])!
    }
}