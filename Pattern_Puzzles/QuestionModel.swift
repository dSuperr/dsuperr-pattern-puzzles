import Foundation

class QuestionModel: Decodable, Identifiable {
    var id:UUID?
    var QuestionLine1:String
    var QuestionLine2:String
    var Option1:String
    var Option2:String
    var Option3:String
    var Option4:String
    var Answer:String
    var Points:String
}
