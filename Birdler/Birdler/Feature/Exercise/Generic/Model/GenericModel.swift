struct Config: Decodable {
    let questions: [Question]
    
    struct Question: Decodable {
        let titleLabel: Text
        let questionsLabel: Text
        let exerciseButtons: [Button]
        let correctAnswer: String
    }
    
    struct Text: Decodable {
        let text: String
    }
    
    struct Button: Decodable {
        let title: String
        let enabled: Bool
        let backgroundColor: String
    }
}

