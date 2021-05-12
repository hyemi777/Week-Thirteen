//
//  ContentView.swift
//  krazy
//
//  Created by Emuela on 11/13/20.
//

import SwiftUI

struct ContentView: View {
    @State var signString = ""
    @State var counter = 0
    @State var pic = "https://www.andreasmarsh.com/images/headerNMIX.jpg"
    var space = "_"
    @State private var datecount = 0;
    var dates = ["Jan 20 - Feb 18",
                     "Feb 19 - March 20",
                     "March 21 - April 19",
                     "April 20 - May 20",
                     "May 21 - June 20",
                     "June 21 - July 22",
                     "July 23 - August 22",
                     "August 23 - Sept 22",
                     "Sept 23 - Oct 22",
                     "Oct 23 - Nov 21",
                     "Nov 22 - Dec 21",
                     "Dec 22 - Jan 19"]
    var signs = ["Aquarius","Pisces", "Aries", "Taurus","Gemini","Cancer","Leo", "Virgo", "Libra","Scorpio","Sagittarius", "Capricorn"]
    var body: some View {
        VStack {
            ExtractedView()
            VStack{
                Picker(selection: $datecount, label: Text("why does this not work")) {
                    ForEach(0..<dates.count) { //index in
                        Text(dates[$0])
                    }}       .onReceive(
                        [self.datecount].publisher.first()){
                        (value) in
                        signString = signs[datecount]
                }
            }

        if #available(iOS 14.0, *) {
            Link(destination: URL(string: "https://emuel.mynmi.net/db2/telme.php?response=hello"+space+pic)!) {
                    Image(systemName: "link.circle.fill")
                        .font(.largeTitle)
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ExtractedView: View {
    var body: some View {
        Text("Pick your birthday. Then click the \n link to see your astrology sign!")
            .font(.body)
            .multilineTextAlignment(.center)
    }
}
