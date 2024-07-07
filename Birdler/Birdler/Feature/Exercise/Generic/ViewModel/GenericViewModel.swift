import Foundation

class GenericExerciseViewModel {
    
    var config: Config?
    var currentQuestionIndex = 0
    var shuffledQuestions: [Config.Question] = []
    
    func loadConfig(completion: @escaping () -> Void) {
        guard let url = Bundle.main.url(forResource: "Exercise", withExtension: "json") else {
            print("Config file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            config = try decoder.decode(Config.self, from: data)
            shuffleQuestions()
            completion()
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func shuffleQuestions() {
        if let questions = config?.questions {
            shuffledQuestions = questions.shuffled()
        }
    }
    
    func getCurrentQuestion() -> Config.Question? {
        return shuffledQuestions.isEmpty ? nil : shuffledQuestions[currentQuestionIndex]
    }
    
    func goToNextQuestion() {
        if currentQuestionIndex < shuffledQuestions.count - 1 {
            currentQuestionIndex += 1
        } else {
            shuffleQuestions() // Embaralha novamente após terminar todas as perguntas
            currentQuestionIndex = 0 // Reinicia para a primeira pergunta da nova ordem embaralhada
        }
    }
}
