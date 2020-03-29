import SwiftUI
import SwiftyHolidays

struct CountryView: View {
    let country: Country
    
    private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        List(country.allHolidays(in: 2020), id: \.name) { holiday in
            Text(holiday.name)
            Spacer()
            Text("\(holiday.date.asDate(in: .current), formatter: self.dateFormatter)")
                .foregroundColor(.secondary)
        }
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
