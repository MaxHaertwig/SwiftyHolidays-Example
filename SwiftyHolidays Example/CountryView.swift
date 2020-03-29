import SwiftUI
import SwiftyHolidays

struct CountryView: View {
    let country: Country
    
    private static let yearFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ""
        return numberFormatter
    }()
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    @State private var year = Calendar.current.component(.year, from: Date())
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        List {
            Stepper(value: $year, in: 1...3000) {
                Text("Year: \(year as NSNumber, formatter: Self.yearFormatter)")
            }
            Section(header: Text("Holidays".uppercased())) {
                ForEach(country.allHolidays(in: year), id: \.name) { holiday in
                    HStack {
                        Text(holiday.name)
                        Spacer()
                        Text("\(holiday.date.asDate(in: .current), formatter: Self.dateFormatter)")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text(country.displayString()), displayMode: .inline)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountryView(country: .germany)
        }
    }
}
