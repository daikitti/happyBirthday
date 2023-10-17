

import SwiftUI

class UpdateBirthdayViewModel {
    func updateBirthday(birthday: BirthdayViewModel) {
        DataManager.shared.updateBirthday(id: birthday.id, name: birthday.name, date: birthday.date)
    }
}
