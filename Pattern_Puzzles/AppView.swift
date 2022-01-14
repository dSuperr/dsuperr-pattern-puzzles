import SwiftUI
import GoogleMobileAds

struct AppView: View {
    @EnvironmentObject var mQuestionViewModel: QuestionViewModel
    var mScreenW = UIScreen.main.bounds.size.width
    var mScreenH = UIScreen.main.bounds.size.height
    @State var mHomeScreen_Empty_Height_1 = UIScreen.main.bounds.size.height*2/12
    @State var mHomeScreen_App_Logo_Height = UIScreen.main.bounds.size.height*2/12
    @State var mHomeScreen_App_Name_Height_1 = UIScreen.main.bounds.size.height/12
    @State var mHomeScreen_App_Name_Height_2 = UIScreen.main.bounds.size.height/12
    @State var mHomeScreen_Empty_Height_2 = UIScreen.main.bounds.size.height/12
    @State var mHomeScreen_Play_Height = UIScreen.main.bounds.size.height*2/12
    @State var mHomeScreen_Empty_Height_3 = UIScreen.main.bounds.size.height*3/12
    @State var mQuestionScreen_Empty_Height_1 = UIScreen.main.bounds.size.height*1/16
    @State var mQuestionScreen_Score_Height = UIScreen.main.bounds.size.height*1/16
    @State var mQuestionScreen_Question_Points_Height = UIScreen.main.bounds.size.height*1/16
    @State var mQuestionScreen_Text_Height_1 = UIScreen.main.bounds.size.height*2/16
    @State var mQuestionScreen_Text_Height_2 = UIScreen.main.bounds.size.height*1/16
    @State var mQuestionScreen_Option_Height = UIScreen.main.bounds.size.height*4/16
    @State var mQuestionScreen_Empty_Height_2 = UIScreen.main.bounds.size.height*1/16
    @State var mResultScreen_Result_Height = UIScreen.main.bounds.size.height*3/12
    @State var mResultScreen_Points_Height = UIScreen.main.bounds.size.height*3/12
    @State var mResultScreen_Empty_Height = UIScreen.main.bounds.size.height*1/12
    @State var mResultScreen_Next_Button_Height = UIScreen.main.bounds.size.height*5/12
    @State var mStatsScreen_Empty_Height_1 = UIScreen.main.bounds.size.height*1/12
    @State var mStatsScreen_Game_Over_Height = UIScreen.main.bounds.size.height*3/12
    @State var mStatsScreen_Score_Height = UIScreen.main.bounds.size.height/12
    @State var mStatsScreen_Best_Score_Height = UIScreen.main.bounds.size.height/12
    @State var mStatsScreen_Try_Again_Height = UIScreen.main.bounds.size.height*3/12
    @State var mStatsScreen_Empty_Height_2 = UIScreen.main.bounds.size.height*3/12
    var body: some View {
        if (mQuestionViewModel.mScreenType == "Home") {
            ZStack {
                VStack {
                    Text("")
                        .frame(height: mHomeScreen_Empty_Height_1)
                    Text("\(mQuestionViewModel.mAppLogo)")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: mScreenW, height: mHomeScreen_App_Logo_Height, alignment: .center)
                    Text("Pattern")
                        .font(Font.custom("AmericanTypewriter-Bold", size: mScreenH/17.5))
                        .bold()
                        .frame(width: mScreenW, height: mHomeScreen_App_Name_Height_1, alignment: .center)
                    Text("Puzzles")
                        .font(Font.custom("AmericanTypewriter-Bold", size: mScreenH/17.5))
                        .bold()
                        .frame(width: mScreenW, height: mHomeScreen_App_Name_Height_2, alignment: .center)
                    Text("")
                        .frame(height: mHomeScreen_Empty_Height_2)
                    Button(action: {
                        mQuestionViewModel.mQuestionScreen_Question_Number = mQuestionViewModel.getRandomQuestionNumber()
                        let lIndex = mQuestionViewModel.mQuestionScreen_Question_Number_Array.firstIndex(of: mQuestionViewModel.mQuestionScreen_Question_Number)
                        mQuestionViewModel.mQuestionScreen_Question_Number_Array.remove(at: lIndex!)
                        mQuestionViewModel.mScreenType = "Question"
                    }, label: {
                        Image(systemName: "play.circle")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    })
                    .frame(height: mHomeScreen_Play_Height, alignment: .center)
                    Text("")
                        .frame(height: mHomeScreen_Empty_Height_3)
                }
                .frame(width: mScreenW, height: mScreenH)
                .background(Color.green)
                .foregroundColor(.white)
                .ignoresSafeArea()
            }
        } else if (mQuestionViewModel.mScreenType == "Question") {
            VStack {
                Text("")
                    .frame(width: mScreenW, height: mQuestionScreen_Empty_Height_1, alignment: .center)
                    .background(Color.green)
                Text("Score: \(mQuestionViewModel.mQuestionScreen_Score)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: mScreenW, height: mQuestionScreen_Score_Height)
                    .background(Color.green)
                Text("\(mQuestionViewModel.getQuestionToughness())")
                    .font(Font.custom("AmericanTypewriter", size: mQuestionScreen_Question_Points_Height/3))
                    .frame(height: mQuestionScreen_Question_Points_Height)
                Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].QuestionLine1)
                    .font(.title)
                    .frame(height: mQuestionScreen_Text_Height_1)
                Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].QuestionLine2)
                    .font(Font.system(size: mQuestionScreen_Text_Height_2/1.75))
                    .frame(height: mQuestionScreen_Text_Height_2)
                HStack {
                    Button(action: {
                        mQuestionViewModel.checkAnswerAndUpdateScore(aOption_Number: 1)
                    }, label: {
                        Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Option1)
                            .foregroundColor(.black)
                            .font(Font.system(size: mQuestionScreen_Text_Height_2/1.75))
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Option_Height, alignment: .center)
                    Button(action: {
                        mQuestionViewModel.checkAnswerAndUpdateScore(aOption_Number: 2)
                    }, label: {
                        Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Option2)
                            .foregroundColor(.black)
                            .font(Font.system(size: mQuestionScreen_Text_Height_2/1.75))
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Option_Height, alignment: .center)
                }
                .frame(height: mQuestionScreen_Option_Height)
                HStack {
                    Button(action: {
                        mQuestionViewModel.checkAnswerAndUpdateScore(aOption_Number: 3)
                    }, label: {
                        Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Option3)
                            .foregroundColor(.black)
                            .font(Font.system(size: mQuestionScreen_Text_Height_2/1.75))
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Option_Height, alignment: .center)
                    Button(action: {
                        mQuestionViewModel.checkAnswerAndUpdateScore(aOption_Number: 4)
                    }, label: {
                        Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Option4)
                            .foregroundColor(.black)
                            .font(Font.system(size: mQuestionScreen_Text_Height_2/1.75))
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Option_Height, alignment: .center)
                }
                .frame(height: mQuestionScreen_Option_Height)
                Text("")
                    .frame(height: mQuestionScreen_Empty_Height_2, alignment: .center)
            }
            .ignoresSafeArea()
        } else if (mQuestionViewModel.mScreenType == "Result") {
            VStack(alignment: .center) {
                if mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Points == "100" && mQuestionViewModel.mQuestionScreen_Last_Correct {
                    Text("Great!")
                        .foregroundColor(mQuestionViewModel.mQuestionScreen_Result_Font_Color)
                        .font(Font.custom("Baskerville-BoldItalic", size: mScreenH/17.5))
                        .frame(height: mResultScreen_Result_Height, alignment: .center)
                } else if mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Points == "200" && mQuestionViewModel.mQuestionScreen_Last_Correct {
                    Text("Brilliant!")
                        .foregroundColor(mQuestionViewModel.mQuestionScreen_Result_Font_Color)
                        .bold()
                        .font(Font.custom("Baskerville-BoldItalic", size: mScreenH/17.5))
                        .frame(height: mResultScreen_Result_Height, alignment: .center)
                } else if mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Points == "400" && mQuestionViewModel.mQuestionScreen_Last_Correct {
                    Text("Marvelous!")
                        .foregroundColor(mQuestionViewModel.mQuestionScreen_Result_Font_Color)
                        .bold()
                        .font(Font.custom("Baskerville-BoldItalic", size: mScreenH/17.5))
                        .frame(height: mResultScreen_Result_Height, alignment: .center)
                } else {
                    Text("Sorry")
                        .foregroundColor(mQuestionViewModel.mQuestionScreen_Result_Font_Color)
                        .bold()
                        .font(Font.custom("Baskerville-BoldItalic", size: mScreenH/17.5))
                        .frame(height: mResultScreen_Result_Height, alignment: .center)
                }
                Text("\(mQuestionViewModel.wrongOrRightPoints())\(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Points)")
                    .foregroundColor(mQuestionViewModel.mQuestionScreen_Result_Font_Color )
                    .font(.system(size: mScreenH/12))
                    .frame(height: mResultScreen_Points_Height, alignment: .center)
                Text("")
                    .frame(height: mResultScreen_Empty_Height, alignment: .center)
                Button(action: {
                    mQuestionViewModel.mQuestionScreen_Question_Number = mQuestionViewModel.getRandomQuestionNumber()
                    mQuestionViewModel.mQuestionScreen_Result_Font_Color = Color.green
                    if (mQuestionViewModel.mQuestionScreen_Question_Number == -1) {
                        mQuestionViewModel.setBestScore()
                        mQuestionViewModel.mScreenType = "Stats"
                    } else {
                        let lIndex = mQuestionViewModel.mQuestionScreen_Question_Number_Array.firstIndex(of: mQuestionViewModel.mQuestionScreen_Question_Number)
                        mQuestionViewModel.mQuestionScreen_Question_Number_Array.remove(at: lIndex!)
                        mQuestionViewModel.mScreenType = "Question"
                    }
                }, label: {
                    Text("Next")
                        .bold()
                        .font(.system(size: mScreenH/20))
                })
                .frame(height: mResultScreen_Next_Button_Height, alignment: .center)
                .accentColor(.black)
            }
        } else if (mQuestionViewModel.mScreenType == "Stats") {
            VStack(alignment: .center) {
                Text("")
                    .frame(height: mStatsScreen_Empty_Height_1)
                Text("Game Over")
                    .bold()
                    .font(.largeTitle)
                    .frame(height: mStatsScreen_Game_Over_Height)
                    .frame(alignment: .bottom)
                Text("Score: \(mQuestionViewModel.mQuestionScreen_Score)")
                    .bold()
                    .font(.title)
                    .frame(height: mStatsScreen_Score_Height)
                Text("Best Score: \(mQuestionViewModel.mQuestionScreen_Best_Score)")
                    .bold()
                    .font(.title)
                    .frame(height: mStatsScreen_Best_Score_Height)
                Button(action: {
                    mQuestionViewModel.populateQuestionNumberArray()
                    mQuestionViewModel.mQuestionScreen_Result_Font_Color = Color.green
                    mQuestionViewModel.mQuestionScreen_Score = 0
                    mQuestionViewModel.mQuestionScreen_Question_Number = mQuestionViewModel.getRandomQuestionNumber()
                    let lIndex = mQuestionViewModel.mQuestionScreen_Question_Number_Array.firstIndex(of: mQuestionViewModel.mQuestionScreen_Question_Number)
                    mQuestionViewModel.mQuestionScreen_Question_Number_Array.remove(at: lIndex!)
                    mQuestionViewModel.mScreenType = "Question"
                }, label: {
                    Text("Try Again")
                        .font(.title)
                        .bold()
                        .frame(width: mScreenW/1.8, height: mScreenH/12)
                })
                .accentColor(.white)
                .background(Color.green)
                .frame(height: mStatsScreen_Try_Again_Height)
                Text("")
                    .frame(height: mStatsScreen_Empty_Height_2)
            }
        }
    }
}
