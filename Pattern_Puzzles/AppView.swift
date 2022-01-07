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
    @State var mQuestionScreen_Score_Height = UIScreen.main.bounds.size.height*2/16
    @State var mQuestionScreen_Question_Points_Height = UIScreen.main.bounds.size.height*1/16
    @State var mQuestionScreen_Text_Height = UIScreen.main.bounds.size.height*5/16
    @State var mQuestionScreen_Option_Height = UIScreen.main.bounds.size.height*3/16
    @State var mQuestionScreen_Result_Height = UIScreen.main.bounds.size.height*2/16
    @State var mResultScreen_Empty_Height_1 = UIScreen.main.bounds.size.height*1/12
    @State var mResultScreen_Game_Over_Height = UIScreen.main.bounds.size.height*3/12
    @State var mResultScreen_Score_Height = UIScreen.main.bounds.size.height/12
    @State var mResultScreen_Best_Score_Height = UIScreen.main.bounds.size.height/12
    @State var mResultScreen_Try_Again_Height = UIScreen.main.bounds.size.height*3/12
    @State var mResultScreen_Empty_Height_2 = UIScreen.main.bounds.size.height*3/12
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
                Text("Score: \(mQuestionViewModel.mQuestionScreen_Score)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: mScreenW, height: mQuestionScreen_Score_Height)
                    .background(Color.green)
                    .padding(.top, mQuestionScreen_Score_Height/4)
                Text("[Points: \(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Points)]")
                    .bold()
                    .font(.title2)
                    .frame(height: mQuestionScreen_Question_Points_Height)
                Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Question)
                    .bold()
                    .font(.largeTitle)
                    .frame(height: mQuestionScreen_Text_Height)
                HStack {
                    Button(action: {
                        mQuestionViewModel.checkAnswerAndUpdateScore(aOption_Number: 1)
                    }, label: {
                        Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Option1)
                            .foregroundColor(.black)
                            .bold()
                            .font(.title)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Option_Height, alignment: .center)
                    .disabled(mQuestionViewModel.mQuestionScreen_Option_Clicked)
                    Button(action: {
                        mQuestionViewModel.checkAnswerAndUpdateScore(aOption_Number: 2)
                    }, label: {
                        Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Option2)
                            .foregroundColor(.black)
                            .bold()
                            .font(.title)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Option_Height, alignment: .center)
                    .disabled(mQuestionViewModel.mQuestionScreen_Option_Clicked)
                }
                .frame(height: mQuestionScreen_Option_Height)
                HStack {
                    Button(action: {
                        mQuestionViewModel.checkAnswerAndUpdateScore(aOption_Number: 3)
                    }, label: {
                        Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Option3)
                            .foregroundColor(.black)
                            .bold()
                            .font(.title)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Option_Height, alignment: .center)
                    .disabled(mQuestionViewModel.mQuestionScreen_Option_Clicked)
                    Button(action: {
                        mQuestionViewModel.checkAnswerAndUpdateScore(aOption_Number: 4)
                    }, label: {
                        Text(mQuestionViewModel.mQuestionModel[mQuestionViewModel.mQuestionScreen_Question_Number].Option4)
                            .foregroundColor(.black)
                            .bold()
                            .font(.title)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Option_Height, alignment: .center)
                    .disabled(mQuestionViewModel.mQuestionScreen_Option_Clicked)
                }
                .frame(height: mQuestionScreen_Option_Height)
                HStack {
                    Button(action: {
                        mQuestionViewModel.mQuestionScreen_Option_Clicked = false
                        mQuestionViewModel.mQuestionScreen_Question_Number = mQuestionViewModel.getRandomQuestionNumber()
                        mQuestionViewModel.mQuestionScreen_Result_Font_Color = Color.green
                        if (mQuestionViewModel.mQuestionScreen_Question_Number != -1) {
                            let lIndex = mQuestionViewModel.mQuestionScreen_Question_Number_Array.firstIndex(of: mQuestionViewModel.mQuestionScreen_Question_Number)
                            mQuestionViewModel.mQuestionScreen_Question_Number_Array.remove(at: lIndex!)
                        } else {
                            mQuestionViewModel.setBestScore()
                            mQuestionViewModel.mScreenType = "Result"
                        }
                    }, label: {
                        if (mQuestionViewModel.mQuestionScreen_Option_Clicked == false) {
                            Text("Skip")
                                .font(.title3)
                                .bold()
                        }
                    })
                    .background(Color.green)
                    .padding(.bottom, mQuestionScreen_Result_Height/4)
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Result_Height, alignment: .center)
                    .accentColor(.white)
                    .disabled(mQuestionViewModel.mQuestionScreen_Option_Clicked)
                    Button(action: {
                        //TODO
                    }, label: {
                        if (mQuestionViewModel.mQuestionScreen_Last_Correct == true){
                            Image(systemName: "checkmark")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(mQuestionViewModel.mQuestionScreen_Result_Font_Color)
                                .frame(height: mQuestionScreen_Result_Height/2, alignment: .center)
                        } else {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(mQuestionViewModel.mQuestionScreen_Result_Font_Color)
                                .frame(height: mQuestionScreen_Result_Height/2, alignment: .center)
                        }
                    })
                    .padding(.bottom, mQuestionScreen_Result_Height/3)
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Result_Height, alignment: .center)
                    Button(action: {
                        mQuestionViewModel.mQuestionScreen_Option_Clicked = false
                        mQuestionViewModel.mQuestionScreen_Question_Number = mQuestionViewModel.getRandomQuestionNumber()
                        mQuestionViewModel.mQuestionScreen_Result_Font_Color = Color.green
                        if (mQuestionViewModel.mQuestionScreen_Question_Number != -1) && mQuestionViewModel.mQuestionScreen_Last_Correct == false {
                            mQuestionViewModel.setBestScore()
                            mQuestionViewModel.mScreenType = "Result"
                        } else if (mQuestionViewModel.mQuestionScreen_Question_Number != -1) {
                            let lIndex = mQuestionViewModel.mQuestionScreen_Question_Number_Array.firstIndex(of: mQuestionViewModel.mQuestionScreen_Question_Number)
                            mQuestionViewModel.mQuestionScreen_Question_Number_Array.remove(at: lIndex!)
                        } else {
                            mQuestionViewModel.setBestScore()
                            mQuestionViewModel.mScreenType = "Result"
                        }
                    }, label: {
                        if mQuestionViewModel.mQuestionScreen_Option_Clicked && (mQuestionViewModel.mQuestionScreen_Last_Correct == true) {
                            Text("Next")
                                .font(.title3)
                                .bold()
                        } else if mQuestionViewModel.mQuestionScreen_Option_Clicked {
                            Text("Results")
                                .font(.title3)
                                .bold()
                        }
                    })
                    .background(Color.green)
                    .padding(.bottom, mQuestionScreen_Result_Height/3)
                    .frame(maxWidth: .infinity)
                    .frame(height: mQuestionScreen_Result_Height, alignment: .center)
                    .accentColor(.white)
                    .disabled((mQuestionViewModel.mQuestionScreen_Option_Clicked == false))
                }
                .background(Color.green)
            }
            .ignoresSafeArea()
        } else if (mQuestionViewModel.mScreenType == "Result") {
            VStack(alignment: .center) {
                Text("")
                    .frame(height: mResultScreen_Empty_Height_1)
                Text("Game Over")
                    .bold()
                    .font(.largeTitle)
                    .frame(height: mResultScreen_Game_Over_Height)
                    .frame(alignment: .bottom)
                Text("Score: \(mQuestionViewModel.mQuestionScreen_Score)")
                    .bold()
                    .font(.title)
                    .frame(height: mResultScreen_Score_Height)
                Text("Best Score: \(mQuestionViewModel.mQuestionScreen_Best_Score)")
                    .bold()
                    .font(.title)
                    .frame(height: mResultScreen_Best_Score_Height)
                Button(action: {
                    mQuestionViewModel.populateQuestionNumberArray()
                    mQuestionViewModel.mQuestionScreen_Result_Font_Color = Color.green
                    mQuestionViewModel.mQuestionScreen_Score = 0
                    mQuestionViewModel.mQuestionScreen_Option_Clicked = false
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
                .frame(height: mResultScreen_Try_Again_Height)
                Text("")
                    .frame(height: mResultScreen_Empty_Height_2)
            }
        }
    }
}
