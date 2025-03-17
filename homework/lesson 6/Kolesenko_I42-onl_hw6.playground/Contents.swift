import UIKit
typealias Student = (name: String, age: Int, grades: [String: Double], optionalSubjects: Set<String>)

var students: [Student] = [
    (
        name: "Max",
        age: 22,
        grades: ["Math": 7.3, "Physics": 6.5, "English": 9.2, "Computer Science": 6.8],
        optionalSubjects: Set(["Physics", "English"])
    ),
    (
        name: "Sam",
        age: 21,
        grades: ["Math": 10.0, "Physics": 9.5, "English": 9.2, "Computer Science": 9.1],
        optionalSubjects: Set(["Physics", "English"])
    ),
    (
        name: "Nathaniel",
        age: 20,
        grades: ["Math": 5.5, "Physics": 4.5, "English": 6.2, "Computer Science": 6.2],
        optionalSubjects: Set(["Physics", "English"])
    ),
    (
        name: "James",
        age: 22,
        grades: ["Math": 6.2, "Physics": 8.5, "English": 9.2, "Computer Science": 9.8],
        optionalSubjects: Set(["Physics", "English"])
    ),
    (
        name: "Brandon",
        age: 20,
        grades: ["Math": 9.0, "Physics": 8.5, "English": 9.2, "Computer Science": 9.8],
        optionalSubjects: Set(["Physics", "English", "History of Gaming"])
    )
]


func calculateAverageGrade(student: Student) -> Double? {
    let grades = student.grades.values
    guard !grades.isEmpty else { return nil }
    
    let total = grades.reduce(0, +)
    let average = total / Double(grades.count)
    return average
}


func findStudentsByAge(students: [Student], age: Int) -> [Student] {
    let studentsByAge20 = students.filter { $0.age == age }
    return studentsByAge20
}

func getTopStudents(students: [Student], top: Int) -> [(name: String, averageGrade: Double)] {
  let sortedStudents = students.sorted { calculateAverageGrade(student: $0) ?? 0 > calculateAverageGrade(student: $1) ?? 0 }
    return sortedStudents.prefix(top).map { (student) -> (name: String, averageGrade: Double) in
      return (name: student.name, averageGrade: calculateAverageGrade(student: student) ?? 0)
    }
}

func getUniqueOptionalSubjects(students: [Student]) -> Set<String> {
     return Set(students.flatMap(\.optionalSubjects))
}



students.map {
    if let average = calculateAverageGrade(student: $0) {
        print("\($0.name)'s average grade: \(average). Hi is \($0.age) yo")
    } else {
        print("\($0.name) has no grades")
    }
}

findStudentsByAge(students: students, age: 20).forEach { print($0.name) }
getTopStudents(students: students, top: 3).forEach { print($0.name) }
getUniqueOptionalSubjects(students: students).forEach { print($0) }

func busyStudent(students: [Student]) -> Student? {
    let sorted = students.sorted {  $0.optionalSubjects.count  > $1.optionalSubjects.count }
    guard let topStudent = sorted.first else { return nil }
    return topStudent
}

print(busyStudent(students: students)?.name)

