import Foundation
import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published var mAppLogo: String = "1 Math"
    @Published var mScreenType = "Home"
    @Published var mQuestionModel = [QuestionModel]()
    @Published var mQuestionScreen_Score: Int = 0
    @Published var mQuestionScreen_Count_Correct: Int = 0
    @Published var mQuestionScreen_Count_Incorrect: Int = 0
    @Published var mQuestionScreen_Question_Number: Int = 0
    @Published var mQuestionScreen_Question_Number_Array: [Int] = []
    @Published var mQuestionScreen_Last_Correct: Bool = false
    @Published var mQuestionScreen_Result_Font_Color = Color.green
    @Published var mQuestionScreen_Best_Score: Int = 0
    
    init() {
        self.mQuestionModel = Parser.getLocalData()
        populateQuestionNumberArray()
        if (UserDefaults.standard.object(forKey: "Best_Score") != nil) {
            mQuestionScreen_Best_Score = UserDefaults.standard.integer(forKey: "Best_Score")
        }
    }

    func populateQuestionNumberArray() {
        mQuestionScreen_Question_Number_Array.removeAll()
        for lCount in 0..<mQuestionModel.count {
            mQuestionScreen_Question_Number_Array.append(lCount)
        }
    }
    
    func setBestScore() {
        if (mQuestionScreen_Score > mQuestionScreen_Best_Score) {
            mQuestionScreen_Best_Score = mQuestionScreen_Score
            UserDefaults.standard.set(mQuestionScreen_Best_Score, forKey: "Best_Score")
        }
    }
    
    func getRandomQuestionNumber() -> Int {
        var lRetVal = -1
        if (mQuestionScreen_Question_Number_Array.count != 0) {
            lRetVal = mQuestionScreen_Question_Number_Array.randomElement()!
        }
        return lRetVal
    }
    
    func wrongOrRightPoints() -> String {
        var lPlusOrMinus = ""
        if mQuestionScreen_Last_Correct {
            lPlusOrMinus = "+"
        } else {
            lPlusOrMinus = "-"
        }
        return lPlusOrMinus
    }
    
    func reducePoints() {
        if mQuestionScreen_Score > Int(mQuestionModel[mQuestionScreen_Question_Number].Points)! {
            mQuestionScreen_Score -= Int(mQuestionModel[mQuestionScreen_Question_Number].Points)!
        } else {
            mQuestionScreen_Score = 0
        }
    }

    func checkAnswerAndUpdateScore(aOption_Number: Int) {
        if (aOption_Number == 1) {
            if mQuestionModel[mQuestionScreen_Question_Number].Option1 == mQuestionModel[mQuestionScreen_Question_Number].Answer {
                mQuestionScreen_Count_Correct += 1
                mQuestionScreen_Score += Int(mQuestionModel[mQuestionScreen_Question_Number].Points)!
                mQuestionScreen_Last_Correct = true
                mQuestionScreen_Result_Font_Color = Color.green
                mScreenType = "Result"
            } else {
                mQuestionScreen_Count_Incorrect += 1
                mQuestionScreen_Last_Correct = false
                mQuestionScreen_Result_Font_Color = Color.red
                mScreenType = "Result"
                reducePoints()
            }
        } else if (aOption_Number == 2) {
            if mQuestionModel[mQuestionScreen_Question_Number].Option2 == mQuestionModel[mQuestionScreen_Question_Number].Answer {
                mQuestionScreen_Count_Correct += 1
                mQuestionScreen_Score += Int(mQuestionModel[mQuestionScreen_Question_Number].Points)!
                mQuestionScreen_Last_Correct = true
                mQuestionScreen_Result_Font_Color = Color.green
                mScreenType = "Result"
            } else {
                mQuestionScreen_Count_Incorrect += 1
                mQuestionScreen_Last_Correct = false
                mQuestionScreen_Result_Font_Color = Color.red
                mScreenType = "Result"
                reducePoints()
            }
        } else if (aOption_Number == 3) {
            if mQuestionModel[mQuestionScreen_Question_Number].Option3 == mQuestionModel[mQuestionScreen_Question_Number].Answer {
                mQuestionScreen_Count_Correct += 1
                mQuestionScreen_Score += Int(mQuestionModel[mQuestionScreen_Question_Number].Points)!
                mQuestionScreen_Last_Correct = true
                mQuestionScreen_Result_Font_Color = Color.green
                mScreenType = "Result"
            } else {
                mQuestionScreen_Count_Incorrect += 1
                mQuestionScreen_Last_Correct = false
                mQuestionScreen_Result_Font_Color = Color.red
                mScreenType = "Result"
                reducePoints()
            }
        } else if (aOption_Number == 4) {
            if mQuestionModel[mQuestionScreen_Question_Number].Option4 == mQuestionModel[mQuestionScreen_Question_Number].Answer {
                mQuestionScreen_Count_Correct += 1
                mQuestionScreen_Score += Int(mQuestionModel[mQuestionScreen_Question_Number].Points)!
                mQuestionScreen_Last_Correct = true
                mQuestionScreen_Result_Font_Color = Color.green
                mScreenType = "Result"
            } else {
                mQuestionScreen_Count_Incorrect += 1
                mQuestionScreen_Last_Correct = false
                mQuestionScreen_Result_Font_Color = Color.red
                mScreenType = "Result"
                reducePoints()
            }
        }
    }
}
