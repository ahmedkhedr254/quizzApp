
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButtom: UIButton!
    @IBOutlet weak var trueButtom: UIButton!
    @IBOutlet weak var progressPar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtomPressed(_ sender: UIButton) {
        let userAnswer=sender.currentTitle
        var correctAnswer:Bool=quizBrain.checkAnswer(userAnswer: userAnswer!)
        if correctAnswer {
            sender.backgroundColor=UIColor.green
            quizBrain.goNextQuestion()
        }
        else{
            sender.backgroundColor=UIColor.red
        }
        
        
        Timer.scheduledTimer(timeInterval : 0.2,target:self,selector: #selector(updateUI),userInfo: nil, repeats: false)
       
    }
    @objc func updateUI(){
        questionLabel.text=quizBrain.getCurrentQuestion()
        progressPar.progress=quizBrain.getProgress()
        
        trueButtom.backgroundColor=UIColor.clear
        falseButtom.backgroundColor=UIColor.clear
    }
    
}

