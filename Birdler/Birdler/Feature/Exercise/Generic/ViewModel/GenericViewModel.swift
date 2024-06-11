import Foundation

class GenericExerciseViewModel {
    
    var config: Config?
    var currentQuestionIndex = 0
    
    func loadConfig(completion: @escaping () -> Void) {
        guard let url = Bundle.main.url(forResource: "Exercise", withExtension: "json") else {
            print("Config file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            config = try decoder.decode(Config.self, from: data)
            completion()
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func getCurrentQuestion() -> Config.Question? {
        return config?.questions[currentQuestionIndex]
    }
    
    func goToNextQuestion() {
        if let config = config, currentQuestionIndex < config.questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            currentQuestionIndex = 0 // Reinicia para a primeira pergunta ou finaliza
        }
    }
}

