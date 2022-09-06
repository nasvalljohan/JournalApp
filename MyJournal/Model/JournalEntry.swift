//
//  JournalEntry.swift
//  MyJournal
//
//  Created by Johan Näsvall on 2022-09-06.
//

import Foundation


// JournalEntry Definierar en enskild entry i våran dagbok.

struct JournalEntry{
    private var formatter = DateFormatter()
    private var unformattedDate: Date
    var content: String
    var title: String
    
    var date: String{
        return formatter.string(from: unformattedDate)
    }
    
    init(content: String, title: String){
        self.formatter.dateStyle = .short
        self.content = content
        self.unformattedDate = Date()
        self.title = title
    }
    init(content: String, date: Date, title: String){
        self.formatter.dateStyle = .short
        self.content = content
        self.title = title
        self.unformattedDate = date
    }

}
