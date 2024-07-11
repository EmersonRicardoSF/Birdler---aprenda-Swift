import UIKit

class GenericExerciseVC: UIViewController {
    
    var genericExerciseScreen: GenericExerciseScreen?
    private var genericExerciseViewModel = GenericExerciseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genericExerciseScreen = GenericExerciseScreen()
        view = genericExerciseScreen
        loadData()
        genericExerciseScreen?.delegate(delegate: self)
    }
    
    private func loadData() {
        genericExerciseViewModel.loadConfig {
            self.loadQuestion()
        }
    }
    
    private func loadQuestion() {
        guard let question = genericExerciseViewModel.getCurrentQuestion() else { return }
        genericExerciseScreen?.configureView(with: question)
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        genericExerciseViewModel.goToNextQuestion()
        loadQuestion()
    }
}

extension GenericExerciseVC: GenericExerciseScreenProtocol {
    func customNavigation() {
        genericExerciseViewModel.goToNextQuestion()
        loadQuestion()
    }
}
    
