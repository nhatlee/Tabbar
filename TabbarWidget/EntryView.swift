//
//  EntryView.swift
//  CustomTabbar
//
//  Created by nhatle on 7/24/20.
//

import SwiftUI

struct EntryView: View {
    let model: WidgetContent

    var body: some View {
        VStack(alignment: .leading) {
            Text(model.name)
              .font(.subheadline)
              .lineLimit(2)
              .fixedSize(horizontal: false, vertical: true)
              .padding([.trailing], 15)
              .foregroundColor(.yellow)

            Text(model.cardViewSubtitle)
              .font(.title)
              .lineLimit(nil)
              .foregroundColor(.blue)

            Text(model.descriptionPlainText)
              .font(.title)
              .fixedSize(horizontal: false, vertical: true)
              .lineLimit(2)
              .lineSpacing(3)
              .foregroundColor(.yellow)

            Text(model.releasedAtDateTimeString)
              .font(.title)
              .lineLimit(1)
              .foregroundColor(.blue)
          }
          .background(Color.blue)
          .padding()
          .cornerRadius(6)
    }
}

//struct EntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryView()
//    }
//}
