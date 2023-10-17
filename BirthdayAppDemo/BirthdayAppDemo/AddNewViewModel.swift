

import SwiftUI

class AddNewBirthdayViewModel {
    
    var titleText: String = "Добавляем"
    
    func saveBirthday(birthday: BirthdayViewModel) {
        DataManager.shared.saveBirthday(id: birthday.id, name: birthday.name, date: birthday.date)
    }
}
