import SwiftQuantumComputing // for macOS

let conf = GeneticConfiguration(qubitCount: 2,
                                depth: (1..<50),
                                generationCount: 2000,
                                populationSize: (2500..<6500),
                                tournamentSize: 7,
                                mutationProbability: 0.2,
                                threshold: 0.48,
                                errorProbability: 0.000000000000001)
let cases = [
    GeneticUseCase(truthTable: [], truthTableQubitCount: 1, circuitOutput: "00"),
    GeneticUseCase(truthTable: ["0", "1"], truthTableQubitCount: 1, circuitOutput: "00"),
    GeneticUseCase(truthTable: ["0"], truthTableQubitCount: 1, circuitOutput: "10"),
    GeneticUseCase(truthTable: ["1"], truthTableQubitCount: 1, circuitOutput: "10")
]
let gates: [Gate] = [HadamardGate(), NotGate()]

let genFac = MainGeneticFactory()
guard let evol = genFac.evolveCircuit(configuration: conf, useCases: cases, gates: gates) else {
    fatalError("Unabe to evolve a circuit")
}

print("Solution found. Fitness score: \(evol.eval)")

let circFac = MainCircuitFactory()
let circ = circFac.makeCircuit(qubitCount: conf.qubitCount, gates: evol.gates)!

let probs = circ.probabilities(afterInputting: "00")!
print("\(probs.count) possible output/s:")
for (output, probability) in probs.sorted(by: { $0.1 > $1.1 }) {
    print(String(format: "%@ -> %.2f %%", output, probability * 100))
}
