//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by EDUARDO MEJIA on 25/03/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //recuperar los entities de Student a trave de property wraoer, sort descriptor =  WHERE //regresa FETCHES Result
    //@EVERYTHING Variables globales dela aplicacion
    @Environment(\.managedObjectContext) var moc //para el objeto hacerlo contexto
    @FetchRequest(entity: Student.entity(), sortDescriptors:[])  var students: FetchedResults<Student> //el moc es para manipular el MOC
    // property wraper = Fetxh Request
    var body: some View {
        VStack{
            List{
                ForEach(students, id:\.id){student in
                    Text(student.name ?? "Unknown")
                }
                
            }
            Button("Add"){
                let firstName = ["Alonso","Adriana","Luna", "Jose"]
                let lastName = ["Gonzalez","Perez","Garcia","Lopez"]
                let chosenFirstName = firstName.randomElement()!//forzar a regresar datos
                let chosenLastName = lastName.randomElement()!
                
                let student = Student(context: self.moc) //contexto para refrescar cambios en entidades
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)" //concatenar valores e insertar espacio en blanco
                try? self.moc.save()// guardar cambios efectuados antes de salir :)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
