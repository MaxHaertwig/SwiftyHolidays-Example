import SwiftUI
import SwiftyHolidays

struct DateCheckerView: View {
    private static let minDate = Calendar.current.date(from: DateComponents(year: 1, month: 1, day: 1))!
    private static let maxDate = Calendar.current.date(from: DateComponents(year: 3000, month: 12, day: 31))!
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    @State private var country = Country.allCases.first!
    @State private var date = Date()
    
    var body: some View {
        List {
            Section(header: Text("Country".uppercased())) {
                HStack {
                    Picker("Country", selection: $country) {
                        ForEach(Country.allCases, id: \.self) { country in
                            Text(country.displayStringWithFlag).tag(country)
                        }
                    }
                    .labelsHidden()
                }
            }
            Section(header: Text("Date".uppercased())) {
                DatePicker("Date", selection: $date, in: Self.minDate...Self.maxDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
            }
            HStack {
                if date.isHoliday(in: country) {
                    Text("\(date, formatter: Self.dateFormatter) is a holiday in \(country.inString)! 🎉")
                } else {
                    Text("\(date, formatter: Self.dateFormatter) is not a holiday in \(country.inString). 😕")
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Date Checker", displayMode: .inline)
    }
}

struct DateCheckerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DateCheckerView()
        }
    }
}
