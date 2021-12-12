import Foundation

class QuestionModel: Decodable, Identifiable {
    var id:UUID?
    var Question:String
    var Option1:String
    var Option2:String
    var Option3:String
    var Option4:String
    var Answer:String
    var Points:String
}
