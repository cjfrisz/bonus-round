{- 
 Copyright Chris Frisz 2012

 This file is part of Bonus Round.

 Bonus Round is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Bonus Round is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Bonus Round.  If not, see <http://www.gnu.org/licenses/>.
-}

{-
---------------------------------------------------------------------
- File Bonus.hs
- Written by Chris Frisz
- 
- Created  9 Jan 2012
- Last modified 10 Jan 2012
- 
- The file Bonus.hs is the main file for the Bonus Round application.
---------------------------------------------------------------------
-}

module Bonus (main) where 

import qualified System.Console.CmdArgs
import System.FilePath

data Mode = Add {name :: String, saveDir :: FilePath, fileTypes :: [String], app :: FilePath}
          | Register {name :: String, saveDir :: FilePath, app :: FilePath}
             deriving (Data, Typeable, Show)
                      
add = Add 
    {name = def &= typ "NAME" &= help "Name used for the game within Bonus Round"
    ,saveDir = def &= typFile &= help "Directory where save files are stored"
    ,fileTypes = def &= typ "EXT_1 ... EXT_n" &= "File extension(s) (i.e. file.EXT) for save files."
    ,app = def &= typFile &= help "Path to the application"
    } &= help "Add an application to Bonus Round."
    
register = Register
    {name = def &= typ "NAME" &= help "Name as previously used to register the application"           
    ,saveDir = def &= typFile &= help "Directory where save files are stored"
    ,app = def &= typFile &= help "Path to the application"
    } &= help "Register a previously-added application on a new computer."
                  