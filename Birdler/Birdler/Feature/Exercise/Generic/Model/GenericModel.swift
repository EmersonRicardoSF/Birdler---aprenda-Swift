struct Config: Decodable {
    let titleLabel: Text
    let questionsLabel: Text
    let exerciseButtons: [Button]
    
    struct Text: Decodable {
        let text: String
    }
    
    struct Button: Decodable {
        let title: String
        let enabled: Bool
        let backgroundColor: String
    }
}

