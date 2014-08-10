//
//  LevelLoader.swift
//  Neutralizer
//
//  Created by Peter Arentsen on 10-08-14.
//  Copyright (c) 2014 Peter Arentsen. All rights reserved.
//

import Cocoa

class LevelLoader {

    func LoadTiles(path: String){
//        let width : Int32;
        let content = StreamReader(path: path ,delimiter: "\r\n");
        while let line = content.nextLine(){
            println(line);
        }
    }
}
