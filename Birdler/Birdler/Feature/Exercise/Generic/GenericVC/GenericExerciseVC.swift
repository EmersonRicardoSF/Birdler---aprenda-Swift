import UIKit

class GenericExerciseVC: UIViewController {
    
    var genericExerciseScreen: GenericExerciseScreen?
    private var genericExerciseViewModel = GenericExerciseViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        genericExerciseScreen = GenericExerciseScreen()
        view = genericExerciseScreen
        loadData()
    }
    
    private func loadData() {
        genericExerciseViewModel.loadConfig {
            guard let config = self.genericExerciseViewModel.config else { return }
            
            self.genericExerciseScreen?.titleLabel.text = config.titleLabel.text
            self.genericExerciseScreen?.questionsLabel.text = config.questionsLabel.text
            
            guard config.exerciseButtons.count == 3 else { return }
            
            self.genericExerciseScreen?.exerciseButtonLeft.setTitle(config.exerciseButtons[0].title, for: .normal)
            self.genericExerciseScreen?.exerciseButtonLeft.isEnabled = config.exerciseButtons[0].enabled
            self.genericExerciseScreen?.exerciseButtonLeft.backgroundColor = UIColor.gray
            
            self.genericExerciseScreen?.exerciseButtonMiddle.setTitle(config.exerciseButtons[1].title, for: .normal)
            self.genericExerciseScreen?.exerciseButtonMiddle.isEnabled = config.exerciseButtons[1].enabled
            self.genericExerciseScreen?.exerciseButtonMiddle.backgroundColor = UIColor.gray
            
            self.genericExerciseScreen?.exerciseButtonRight.setTitle(config.exerciseButtons[2].title, for: .normal)
            self.genericExerciseScreen?.exerciseButtonRight.isEnabled = config.exerciseButtons[2].enabled
            self.genericExerciseScreen?.exerciseButtonRight.backgroundColor = UIColor.gray
        }
    }
}

