//
//  Tile.swift
//  Neutralizer
//
//  Created by Peter Arentsen on 10-08-14.
//  Copyright (c) 2014 Peter Arentsen. All rights
import SpriteKit;

    enum TileCollision: Int {
        case Passable = 0, Impassable, Platform, PositiveTile, NegativeTile, DropTile, EmptyTile, ExitTile
    }

    struct Tile {
        var collision: TileCollision;
        var sprite: SKSpriteNode?
        static let Width = 64;
        static let Height = 48;
        static let Size = CGVector(CGFloat(Tile.Width), CGFloat(Tile.Height));
        
        init(sprite: SKSpriteNode?, tileCollision: TileCollision){
            self.collision = tileCollision;
            self.sprite = sprite;
        }
    }

