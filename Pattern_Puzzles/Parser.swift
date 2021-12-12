import Foundation

class Parser {
    static func getLocalData() -> [QuestionModel] {
        let lPathString = Bundle.main.path(forResource: "App1_json", ofType: "json")
        guard lPathString != nil else {
            return [QuestionModel]()
        }
        let lUrl = URL(fileURLWithPath: lPathString!)
        do {
            let lData = try Data(contentsOf: lUrl)
            let lDecoder = JSONDecoder()
            do {
                let lQuestionData = try lDecoder.decode([QuestionModel].self, from: lData)
                for r in lQuestionData {
                    r.id = UUID()
                }
                return lQuestionData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        return [QuestionModel]()
    }
}
