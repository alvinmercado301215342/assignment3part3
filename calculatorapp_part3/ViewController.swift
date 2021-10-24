// Calculator App Part 3
// Name 01               : Alvin Carl Mercado
// Student ID            : 301215342
// Name 02               : Ishtiaque Ahmed
// Student ID            : 301223010
// Date last modified    : Oct. 22, 2021
// Short revision history: Changed the back buttom from an image to a button. (8:00 PM 9/17/21) Display a number when the button is pressed. (9:00 PM 9/17/21) Added all the calculator operation functions as required in assignment #2 document. (4:00 PM 10/01/21) Worked on the landscape mode and added additional functions. (11:00 PM 10/22/21)
// Short description of the program: This is a standard calculator with arithmetic operations. This calculator built with swift programming language.


import UIKit
// Creating View Controller Class
class ViewController: UIViewController
{

  
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var displayResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        clearAll()
    }
    

    // Creating clear all function
    func clearAll()
    {
        workings = ""
        display.text = ""
        displayResults.text = "0"
    }
// Creating equal button including the percentage
    @IBAction func pressEqual(_ sender: Any)
    {
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            displayResults.text = resultString
        }
        else //If the input is invalid, it will show the error message
        {
        let alert = UIAlertController(
        title: "Invalid Input",
        message: "Calculator unable to do math based on input",
        preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Okay", style: .default))
    self.present(alert, animated: true, completion: nil)
        }
        }
    

    // Creating valid input boolean function
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    // Creating boolean function for special characters
    func specialCharacter (char: Character) -> Bool
    {
    
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        if(char == "-")
        {
            return true
        }
        if(char == ".")
        {
            return true
        }
        return false
    }
    // Creating function to specify decimal points
        func formatResult(result: Double) -> String
        {
            if(result.truncatingRemainder(dividingBy: 1) == 0)
            {
                return String(format: "%.0f", result)
            }
            else
            {
                return String(format: "%.8f", result)
            }
        }
    // Calls the clearAll function
    @IBAction func pressClear(_ sender: Any)
    {
        clearAll()
    }
    // Removes the last character from display
    @IBAction func pressBack(_ sender: Any)
    {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            display.text = workings
        }
    }
    // Creating function for currently working display
    func addToWorkings(value: String)
    {
        workings = workings + value
        display.text = workings
    }
    // Display percentage on pressing the percent button
    @IBAction func pressPercent(_ sender: Any)
    {
        addToWorkings(value: "%")
    }
    // Display divide on pressing the divide button
    @IBAction func pressDivide(_ sender: Any)
    {
        if (validInput())
        {
        addToWorkings(value: "/")
        }
    }
    // Display multiplication on pressing the multiplication button
    @IBAction func pressMultiply(_ sender: Any)
    {
        if (validInput()) {
        addToWorkings(value: "*")
        }
    }
    // Display minus on pressing the minus button
    @IBAction func pressMinus(_ sender: Any)
    { if(validInput()) {
        addToWorkings(value: "-")
    }
    }
    // Display addition on pressing the addition button
    @IBAction func pressPlus(_ sender: Any)
    { if (validInput()) {
        addToWorkings(value: "+")
    }
    }
    // Display dot on pressing the dot button
    @IBAction func pressDot(_ sender: Any)
    {
        if (validInput()){
        addToWorkings(value: ".")
        }
    }
    // Display numbers on pressing the number buttons
    @IBAction func pressZero(_ sender: Any)
    {
        addToWorkings(value: "0")
    }
    
    @IBAction func pressOne(_ sender: Any)
    {
        addToWorkings(value: "1")
    }
    
    @IBAction func pressTwo(_ sender: Any)
    {
        addToWorkings(value: "2")
    }
    
    @IBAction func pressThree(_ sender: Any)
    {
        addToWorkings(value: "3")
    }
    
    @IBAction func pressFour(_ sender: Any)
    {
        addToWorkings(value: "4")
    }
    
    @IBAction func pressFive(_ sender: Any)
    {
        addToWorkings(value: "5")
    }
    
    @IBAction func pressSix(_ sender: Any)
    {
        addToWorkings(value: "6")
    }
    
    @IBAction func pressSeven(_ sender: Any)
    {
        addToWorkings(value: "7")
    }
    
    @IBAction func pressEight(_ sender: Any)
    {
        addToWorkings(value: "8")
    }
    
    @IBAction func pressNine(_ sender: Any)
    {
        addToWorkings(value: "9")
    }
    @IBAction func pressPlusMinus(_ sender: Any) {
        do {
                       // calculatorWorkings.text = String(Int(calculatorWorkings.text!)! * -1)


                         displayResults.text = String(Float(displayResults.text!)! * -1)

                    }
    }
}


