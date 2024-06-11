
import Foundation

class GenericExerciseViewModel {
    
    var config: Config?
    
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
}

