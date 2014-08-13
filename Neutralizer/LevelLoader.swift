//
//  LevelLoader.swift
//  Neutralizer
//
//  Created by Peter Arentsen on 10-08-14.
//  Copyright (c) 2014 Peter Arentsen. All rights reserved.
//

import SpriteKit

class LevelLoader {
    
    let InvalidPosition = CGPoint(x: -1, y: -1)
    var exit: CGPoint
    
    init(){
        exit = InvalidPosition;
    }

    func LoadTiles(path: String){
        var width : Int = 0;
        let content = StreamReader(path: path ,delimiter: "\r\n");
        var lines: [String] = [];
        var firstLine = content.nextLine();
        width = countElements(firstLine!);
        content.rewind();
        var lineCount = 0;
        while let line = content.nextLine(){
            lines.append(line);
            lineCount += 1;
            assert(countElements(line) == width, "The length of line is different from all preceeding line");
        }
        //var test = [Tile](count: 3, repeatedValue: 12)
        var tiles = Array<Array<Tile?>>();
        tiles = [[Tile?]](count: width, repeatedValue: [Tile?](count: lineCount, repeatedValue: nil));
        for y in 0..<lineCount {
            for x in 0..<lines.count {
                println("x = " + String(x))
                println("y = " + String(y))
                var tileType = Array(lines[y])[x];
                tiles[x][y] = LoadTile(tileType, x: x, y: y)!
            }
        }
    }
    
    func GetBounds(x: Int, y: Int) -> CGRect {
        return CGRect(x: x * Tile.Width, y: y * Tile.Height, width: Tile.Width, height: Tile.Height)
    }
    
    func LoadTile(tileType: Character, x: Int, y: Int) -> Tile?{
        switch (tileType){
        case ".":
            return Tile(tileCollision: TileCollision.Passable);
        case "X":
            return LoadExitTile(x,y: y)
        case "1":
            return Tile(tileCollision: TileCollision.Passable);
        case "-":
            return Tile(tileCollision: TileCollision.Passable);
        case "#":
            return Tile(tileCollision: TileCollision.Passable);
        default:
            assert(false, "Missing type");
        }
        return nil;
    }
    
    func LoadExitTile(x: Int, y: Int) -> Tile {
        assert(exit != InvalidPosition, "A level may only have one exit")
        exit = CenterRectangle( GetBounds(x, y: y))
        return Tile(tileCollision: TileCollision.ExitTile);
    }
    
    func CenterRectangle(rect: CGRect) -> CGPoint {
        return CGPoint(x: (rect.origin.x+(rect.size.width/2)), y: rect.origin.y + (rect.size.height / 2))
    }
}
