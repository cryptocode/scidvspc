 Scid vs. PC

Scid vs. PC
===========

Chess Database and Toolkit

![](images/logo.png)

  

-----------------------------------------------------

1. [introduction](README.html#s1)
---------------------------------

2. [features](README.html#s2)
-----------------------------

3. [download](README.html#s3)
-----------------------------

4. [installation](README.html#s4)
---------------------------------

5. [news](README.html#s5)
-------------------------

6. [miscellaneous](README.html#s6)
----------------------------------

*   6.1 [docked windows](README.html#ss6.1)
*   6.2 [how to play](README.html#ss6.2)
*   6.3 [todo](README.html#ss6.3)
*   6.4 [known issues](README.html#ss6.4)
*   6.5 [bugs](README.html#ss6.5)
*   6.6 [thanks](README.html#ss6.6)
*   6.7 [scid's history](README.html#ss6.7)

7. [changes](README.html#s7)
----------------------------

8. [contact](README.html#s8)
----------------------------

9. [links](README.html#s9)
--------------------------

* * *

1. [introduction](#toc1)
------------------------

![](images/scidvspc.png)

**Shane's Chess Information Database** is a powerful Chess Toolkit, with which one can create huge databases, run chess engines, and play casual games against the computer or online with the Free Internet Chess Server. It was originally written by Shane Hudson , and has received strong contribution from Pascal Georges and others.

[Scid vs. PC](http://scidvspc.sourceforge.net/) began with bug-fixes for the computer-versus-player features of Scid (hence the name), but has evolved into a solid alternative with many new features and interfaces. The project is authored by [Stevenaaus](#contact_) and numerous contributors [(thanks)](#thanks_).

2. [features](#toc2)
--------------------

_See [changes](#changes_) for a comprehensive changelog, or the [gallery](https://sourceforge.net/apps/gallery/scidvspc/index.php) for some screenshots._.

### New and Improved features

*   Overhauled and customizable interface.
*   Engine versus engine computer tournaments.
*   Extra search features, including move, end-of-game, and stalemate/checkmate searches.
*   Drag+Drop file opens for Windows and Linux.
*   Rewritten Gamelist widget with convenient context menus and buttons, and integrated Database Switcher.
*   Improved Computer Game and FICS features, including premove, and simultaneous observed games.
*   Many chess engine improvements, including max-ply option, an unlimited number of engines running, and the function hot-keys can be explicitly set.
*   New EPD search and analyze features.
*   Tri-coloured Tree bar-graphs, and options for more or less statistics.
*   Ratings Graph can show multiple players, and Score graph is an attractive bar graph.
*   Improved Book windows, including book compare, and remove move features.
*   Redone Button and Tool bars.
*   The Chessboard/Pieces config widget has been overhauled, and includes support for custom tiles and pieces.
*   Browse multiple games.
*   Recent Game and Player-info histories.
*   Bug tested Undo and Redo features.
*   The Help index is meaningful to new users, with links to the game's main features.
*   Clickable Variation Arrows, and Paste Variation feature.
*   A user friendly Annotation feature, with search-to-depth feature.
*   Better support for UTF and Latin character sets in PGN export/imports.
*   Improved and more powerful Tree Mask feature.

*   Chess 960 / Fischer Chess is now supported (only by a patch).

3. [download](#toc3)
--------------------

Source [scid\_vs\_pc-4.23.tgz](http://sourceforge.net/projects/scidvspc/files/source/scid_vs_pc-4.23.tgz/download)

Windows [Scid vs PC-4.23.exe](http://sourceforge.net/projects/scidvspc/files/windows/Scid%20vs%20PC-4.23.exe/download)

Windows 64 bit [Scid vs PC-4.23.x64.exe](http://sourceforge.net/projects/scidvspc/files/windows-64bit/Scid%20vs%20PC-4.23.x64.exe/download)

Mac [ScidvsMac-4.23.dmg](http://sourceforge.net/projects/scidvspc/files/mac/ScidvsMac-4.23.dmg/download)

Mac 64bit (beta) [ScidvsMac-4.23.x64.dmg](https://sourceforge.net/projects/scidvspc/files/mac-64bit-unsupported/ScidvsMac-4.23.x64.dmg/download)

### Other resources

The latest code is available from subversion [https://sourceforge.net/p/scidvspc/code/HEAD/tree/](https://sourceforge.net/p/scidvspc/code/HEAD/tree/)

Other project [files](https://sourceforge.net/project/showfiles.php?group_id=263836)

4. [installation](#toc4)
------------------------

### Linux , Unix

_Installing from source is reccommended, though there exists deb packages (from third parties) in the [linux packages](https://sourceforge.net/projects/scidvspc/files/linux%20packages/)_

Scid vs. PC requires Wish (Tcl/Tk) 8.5 or later and a C++ compiler. Example packages required include "tcl, tk, tcl-devel, tk-devel" and "gcc-c++ , libstdc++"; but of course will vary with your distribution.

The default installation directory is **/usr/local**, which is generally empty, but any version of Scid here will be overwritten. To install into **/usr** (for eg) use **./configure BINDIR=/usr/bin/ SHAREDIR=/usr/share/scid/**

Installing from source:

* * *

tar -xzf scid\_vs\_pc-4.23.tgz
cd scid\_vs\_pc-4.23
./configure
make
sudo make install
scid

* * *

Extra chess pieces (such as Berlin) are now enabled by default for Wish 8.6, but 8.5 requires installing TkImg. Sound support requires Snack.  
If your distro does not provide these packages ("tkimg", "tcl-snack"), you can install from source using these links (both of which have fixes applied).  
[TkImg](https://sourceforge.net/project/downloading.php?group_id=263836&filename=tkimg1.3.scidvspc.tar.bz2), [Snack](http://sourceforge.net/projects/scidvspc/files/support%20files/snack2.2.10.scidvspc.tgz/download).

_Note Wish 8.5.10 has severe bugs, and many versions of Tk-8.6.x have \*severe\* memory leaks. To avoid many of these leaks, or simply for a performance boost, compile with Gregor's tk::text (patches/gregors\_tktext\_inline.patch)._

### Windows

Windows installation simply requires downloading the [executable](#download_), and following the prompts.

The configuration files, **including the chess engine list**, are stored in the **Scid-vs-PC\\bin\\config** directory, and may be copied over from old versions to make upgrading easier. If the app is installed in "Program Files" On Windows 7, the config files are mirrored in C:\\Users\\\[USERNAME\]\\AppData\\Local\\VirtualStore\\Program Files\\Scid vs PC

Our main windows build system is MinGW and Makefile.mingw. We also have a Makefile.vc for visual studio, but it does not get updated too often.

### Mac OS X

The [ScidvsMac-4.23 app](#download_) should include everything you need. Simply drag and drop the App into /Applications (or similar). It cannot be run from the dmg disk image.

Due to complicated build reasons, only Yosemite (OS X 10.10) and later are now supported. Additionally, Catalina has removed 32-bit app support, and it is only supported by our beta ScidvsMac-x64 app, as 64-bit Wish is not as robust as the old version.

To compile from source - once you have XCode installed - please read **ScidvsMac-HowTo.rtfd** in the source tarball for some older information.

_Users upgrading may have to remove (or edit) **$HOME/.scidvspc/config/engines.dat** to properly configure the chess engines._

5. [news](#toc5)
----------------

**July 2017**

Thanks to (our best bug reporter) Ileano for finding a bug in the new Best-Games/Browser feature. I've made a 4.18.1 point release to include the fix. This version also includes a minor PGN import fix.

**October 2016**

4.17 has a bit of a tough life, and is being re-released with a bug fix 28th October. Otherwise, it is an exciting release for hackers, with patches for chess960 and Gregors speedy tkText rewrite.

**April 2015**

Exciting to have some usability fixes for the Tree Mask. Hopefully this feature will start to get some real use.

**December 2013**

4.11 is out, with large board sizes, and a fix for the annoying filter/tree issue.

**April 2013**

Finally have a docked windows feature. It's a damn complicated thing, but i am fond of it. Scid vs PC 4.9 is coming :)

**March 2012**

Big effort by Gregor to write Drag and Drop support for Scidb and ScidvsPC. Thanks. FICS is looking great too.

**September 29, 2011**

Jiri Pavlovsky has made a windows installer. It's a nice piece of software :) Big thank-you. And we now have undo and redo features.

**July 8, 2011**

Thanks to Gilles for the web page restructure and OSX testing. Gregor Cramer [http://scidb.sf.net](http://scidb.sf.net) has contributed a PGN figurine feature.

**April 19, 2011**

A belated thanks to Lee from Sourceforge for [this article](http://sourceforge.net/blog/after-scid-row-a-new-chess-app-is-born/).

**December 10, 2010**

Scid vs. PC 4.2 includes support for Scid's si4 db format.

**July 3, 2010**

For the tenth release I've adopted verison number 4.0 . It includes a new Computer Tournament feature (thanks to some UCI snippets from Fulvio) and the Gamelist Widget is finally up-to-speed for large databases.

**April 19, 2010**

Release 3.6.26.9 includes a Fics accept/decline offers widget.

**December 20, 2009**

Thanks to Dorothy for making me a Mac DMG package with this release , 3.6.26.8.

**August 16, 2009**

With 3.6.26.6 I've fixed Phalanx's illegal castling. There is also changes to the Setup board and Toolbar configuration widgets.

**July 17, 2009**

3.6.26.5 - New Gamelist widget, and re-fashioned main buttons. Project's looking quite solid :->

**June 23, 2009**

The monkey on my back has really been having a good time. This release includes changes to the Gameinfo, Comment Editor, and Board Style widgets, some new chess pieces, colour schemes and tiles. Thanks to Michal and Alex for feedback.

**June 4, 2009**

Well, the html is up, and i've got a couple of files in the downloads section. My project is fairly modest fork of Scid ... just rewriting Tk widgets when i get the urge.

6. [miscellaneous](#toc6)
-------------------------

6.1 [docked windows](#toc6.1)
-----------------------------

This powerful feature is maturing. See the Docked Windows help item for more info.

*   Window focus automatically follows the mouse around, and also impacts which keyboard bindings are active. Most bindings are active when the mouse is over the main board.
*   In the event of Scid failing to start, restart the program with the **\-nodock** option.
*   Windows undocked from within docking mode can have glitches. Mainly: drag and drop game copies in the switcher don't work.
*   OS X support is not great.

Make sure to check out the new Theme Options, which affect how the Docked Windows (and Gamelist) look and feel.

6.2 [how to play](#toc6.2)
--------------------------

**Playing against the Computer**

The main Computer vs. Player feature is accessed from **Play->Computer**. Here you'll find options to play against Phalanx (a flexible computer opponent whose skill you can select), or any installed UCI engine.

**Playing on the Internet**

Playing on the Internet is done via the the **Play->Internet** menu item. I recommend visiting the [Fics](http://www.freechess.org) website to create a user account, but it is also possible to play anonymously. To start a game, press the **Login as Guest** button, then watch the available games as they are announced in the console. Enter **play \[game number\]** to accept a game challenge.

_There is more information about the Fics and Tactical Game features in the Scid Help menus_.

6.3 [todo](#toc6.3)
-------------------

*   The TCL sound package, Snack, needs fixing and a maintainer.
*   Openseal is an open source version of FICS Timeseal. It needs some rewriting to work with Scid, though it is a small program.
*   FICS could be adapted to work with the ICC. The work involves analysing the differences in the strings used by the two programs. (for example, for FICS we have this line to ackowledge successful log-in if {string match "\*Starting FICS session\*" $line\]} { The two servers do have many similarities i think, and examining xboard's "backend.c" (or some other client) for "FICS" particularities
*   Translation updates are always welcome
*   There are two engine types - UCI and XBoard. Pascal's UCI code is in some ways inferior to Shane's Xboard code. Though this is mostly mitigated by the speed of modern processors, it'd be nice to make use of the UCI ponder feature in analysis mode (Comp mode already does so).
*   Verify/update the Novag Citrine drivers and interface, and Correspondence / XFCC feature.
*   Our Windows port needs a little overhaul to properly use Users home directory to store all the various data. I will get around to doing it one day though.
*   A lot of people use chessbase books (.ctg). Scid can only read polyglot opening books, but inlining Scidb's support for ctg may not be too hard.

6.4 [known issues](#toc6.4)
---------------------------

*   macOS Catalina and later are only supported by the buggy and slow 64 bit version.
*   Linux sound playback is buggy/broken. The Wish sound package (Snack) needs maintenance.
*   Tcl/Tk-8.5.10 is buggy.
*   Some versions of Tk-8.6.x have severe memory leaks. To avoid, compile with Gregor's tk::text (patches/gregors\_tktext\_inline.patch).
*   PGN Window slow-downs (with huge games) can also be fixed using Gregor's tk::text.
*   OS X docked mode has some issues due to it's poor Tcl/Tk.
*   **Focus Issues**. KDE users can allow Tcl apps to properly raise themselves by configuring desktop > window behavior > advanced > focus stealing prevention set to "none"
*   Sometimes Scid vs. PC may have very loud/wrong colours. This can be caused by the Window Manager exporting their color schemes, and can normally be switched off somewhere in the window manager's colour settings.

6.5 [bugs](#toc6.5)
-------------------

*   See the known issues about Tcl/Tk (above).
*   Importing huge PGN archives can sometimes fail. The command line utility **pgnscid** is a more reliable way to create large databases from pgn. Typing "pgnscid somefile.pgn" creates a new database "somefile.si4".
*   Using the '+' operator and clicking on 'Find' in the gamelist widget can be very slow. The code needs to be moved from gamelist.tcl to tkscid.cpp.
*   Windows only:
    *   Using "ALT+F"... etc key bindings to access the menus is badly broke. This is a Tcl/Tk issue.
    *   Window focus/raise issues, another Tcl/Tk issue.
    *   Screenshots are broken/disabled.

6.6 [thanks](#toc6.6)
---------------------

Thanks to Shane Hudson and the authors of [Tcl/Tk](http://tcl.tk). To [Gregor Cramer](http://scidb.sf.net) for new features and technical support. Ozkan for his Win64 builds and knowledgable help. Christian Opitz for his comprehensive German translation. [Sourceforge.net](http://sourceforge.net) for their great hosting, Jiri Pavlovsky for the [windows installer](http://www.jrsoftware.org/isinfo.php). Thanks to Pascal Georges for his many technical contributions to mainline Scid, and also Fulvio, Gerd and the language translators. To Gilles, Dorothy and Steve for OS X support, to Michal Rudolf for early encouragement, and [H.G.Muller](http://home.hccnet.nl/h.g.muller/chess.html) for technical feedback.

6.7 [scid's history](#toc6.7)
-----------------------------

Scid is a huge project, with an interesting history. Originally authored by Shane Hudson from New Zealand, it combined the power of Tk's GUI and the speed of C, to produce a free Chess Database application with Opening Reports, Tree Analysis, and Tablebase support. It gained quite some attention, as it was arguably the first project of it's kind; but after writing over a hundred thousand lines of code, in 2004 development stopped and Shane never contributed to Scid again.

Two new versions of Scid appeared around 2006. The first was ChessDB authored by Dr. David Kirby. With some good documentation and the ability to automatically download games from several web portals, it became popular. But at the same time Pascal Georges from France was making strong technical improvements to Scid. Frustrated with Scid's dormancy, and because of disagreements with ChessDB's author, Pascal released his own tree, Scid-pg, which included UCI support and numerous Player versus Computer features.

But subtley, and with some controversy, he began to adopt the name Scid as his own. Some people objected, especially Dr. Kirby, with whom a flame war began, but Pascal's efforts to gain ownership of the Sourceforge Scid project eventually succeeded.

Under Pascal, and with the help of numerous contributors, Scid again strode forward. Pascal wrote a Tree Mask feature, and in 2009 he upgraded the database format to si4, all the time making speed and technical improvements to the neglect of the interface. In 2010, Pascal ceased contributing at all, and shortly after Scid 4.3 was released. Since then, Scid has had widespread technical changes by Fulvio Benini, who is a long-standing contributor.

Currently there exist several Scid related projects.

Chessx was originally by Michal Rudolf (a longtime Scid contributor from Germany) and named Newscid. Now led by Jens Nissen, with a 1.0 release, it is an attractive Chess GUI but with a small feature set and without si4 support.

Scid vs. PC was started in 2009 by Steven Atkinson from Australia. Forked from Scid-3.6.26, it began as an effort to consolidate many of Pascal's new features, and has since matured into a capable Scid successor.

The Android app, Scid on the Go, supports the si4 database format, and is the only mobile Scid related project.

Another huge project, now without a maintainer, is Scidb by Gregor Cramer from Germany. It is an ambitious chess database program inspired by Scid, with heavy utilization of C++ classes and customized Tk widgets. It also supports Chessbase databases and many chess variants.

7. [changes](#toc7)
-------------------

### Scid vs. PC 4.23

*   Game move/reorder feature - From the gamelist context menu it is possible to move single games to any position in the DB. Seems robust, but please backup DBs. Short 'moves' only require a few si4 writes, longer ones basically rewrite the entire si4 file, and if interupted DB will be broken.  
      
    
*   Browse multiple games feature - please read help topic.
*   Player Ratings graph can now (optionally) use the ratings history in the spelling "ratings.ssp" file.
*   New Online tablebase lookups by Michael Brown (lokasoft bases are gone), and other minor tablebase window tweaks.
*   PGN Window has a new 'Delete Comment' context menu.
*   MS Windows bugfix - can now have sg4 files larger than 2gb.
*   Allow for globbing/wildcard matches in the Name Editor date fields.
*   Time graph: when we are calulating movetimes from %clk, allow for a TimeControl tag.
*   Give the comment editor some decent colours, and increase board size.
*   Player vs UCI Game - nodes do not have to be in 1000s (helpful for some new chess engines).
*   Tree mask/cache - change 'fill with base' to 'fill with filter', speed up mask fill, and fix up the progress window..
*   Don't auto-focus text widget in comment editor as there may be timing related side effects.  
      
    
*   New treeviewFont.diff patch which allows the gamelist font to be configured (system Small font).
*   Nicer board arrows.
*   Ensure Stockfish w/d/l percentiles total 100 - author Michael.
*   Better allign the UCI config window widgets - author Aditya.
*   Epd load random position (Control-?).

### Scid vs. PC 4.22

*   Show Stockfish Win/Draw/Loss (as White/Draw/Black) infos in information window.
*   Add an 'Extra Tags' field to the header search (eg 'Annotator').
*   Revamp colours and size of the Comment Editor.
*   New 'Highlight' colour option (affects crosstable, reports, pgn moves and name-editor).
*   Animate the Rook in Castling. (author Uwe - Nice).
*   Engine analysis: option to wrap long lines.
*   Engine annotation: option to disable adding an end-of-game variation.
*   Playing an opening against an UCI engine - openings can be imported from the ECO Window.
*   Improve the tree training feature by automatically enabling Trial mode.
*   Minor tweaks to the spacing in long comments in the PGN and Gameinfo windows..
*   Export Games: add option to disable inserting newlines every 80 chars or so.
*   Serious game: When using book, leave a comment when book is exited / exhausted.
*   Add an undo point at the start of every annotation game.
*   Add a Switcher menu item to show/hide the gamelist buttonbar.
*   Update Player Data (spelling) file.  
      
    
*   Help and translation updates.
*   Book tuning tweaks.
*   Graph window tweaks.
*   ECO window tweaks.  
      
    Bug Fixes
*   The Gamelist 'next moves' feature didn't work for transpositions at differing depths.
*   Remember arrow lengths/widths.
*   Batch stripping comments/vars could sometimes break the namebase.
*   Fix / enable hiding of 'Colored Squares and Arrows' on the main board.
*   Windows drag and drop typo/fix from Oz.

### Scid vs. PC 4.21

*   Gamelist (and Best Games) can now show 'Next Moves' instead of just the 'Opening Moves' if the tree is open and adjusting filter.
*   Text foreground colour option for listboxes and text windows. (and remove the 'global' colour option which is too rough).
*   Fics: allow moves made by examiners to be seen by other examiners/observers, and fix longstanding init fail.
*   Mac: 64 bit macOS port. Poor performance but mostly working.  
      
    Engines
*   Allow multiple engine logs at once, which can be nicely updated in real-time (and bind 'space' to engine stop/start).
*   Small engine boards now have an alternative display mode: Arrow shows best move.
*   Free up right-click for windows 'copy text'. (Use middle click instead for toggling analysis modes).
*   Can now always show 'Infos' via an option in the main Engine config widget.
*   Low level support for alternative "GO" modes for UCI engines. (::uci::goCommand).
*   Give transient engine popup buttons the same bindings as their originals.  
      
    EPD Window
*   New annotaion/analyze features (UCI only): Count best moves and (optionally) show/store results. Allow selecting the engine.
*   New 'find' entrybox searches EPD file for matching text.
*   Basic EPD/FEN export feature.
*   Menu rearranges, including enabling more translations, and changing menubuttons to standard menu widgets.
*   Paste analysis now removes previous analysis opcodes.
*   Bind space in listbox to start/stop engine.  
      
    Minor
*   Tree window - options to hide buttonbar, and always 'Adjust' filter.
*   Display a board in the Player Report (if applicable).
*   Full German help update from Christian.
*   Improve Gamelist 'see' issues.
*   Brazil-Portuguese language update from Gilberto de Almeida Peres.
*   Opening Books - don't clobber existing game mainline with book import (was 'export'). Unneeded 'update -pgn' was slowing everything down too.
*   Refresh score graph at end of fics game.
*   Pressing End key twice always goes to game end.
*   Show Tux in the comment editor, and update the gifs.
*   Update chess 960 patch.
*   New flip board button.
*   scidt reverse sort feature. Also - don't accept empty sort criteria, and accept 'si4' filenames.
*   Don't ask to 'Save Game' if the game length is zero, and try to stop ECO window clobbering (any) game changes (New 'sc\_game info halfmoves' command).  
      
    Bugfixes
*   PGN - Properly handle all level of var indentation.
*   Windows: Fix extra text in the Player Info windows.
*   Fix Tree cache getting saved with app close.

### Scid vs. PC 4.20

*   The Score Graph can now display move-times (using "%emt" and "%clk" pgn values).
*   Option to display a black rectangle for the "selected square" instead of a coloured square (Options->Moves->ColorSelected).
*   Several translation updates including a complete German help file from Christian Opitz.
*   The Setup Board window now has a coordinate axis and a flip button.
*   Computer Tournament - Don't enforce a ten-engine limit, have a new statusbar to show progress and the winner, include Uwe Klimmek's carousel scheduling.
*   EPD rewrite from Bonnie A. - Annotations are now compliant with the EPD specification, Flips the board to side-to-move, other bug fixes.
*   In Game Annotation, don't miss analysing last-move blunders.
*   The ECO finder has a basic "Find Opening by Name" feature.
*   A quick Piece Position Search implemented using CQL.
*   Gameinfo window always shows a rehoned "Material Advantage" value.
*   Board Options window can now display all custom piecesets in a gridded manner, and also highlights the current piece style.
*   FICs - Automatically store move-times, some changes to the button/font, and don't store adminBOT tells.
*   Tree Mask - Add 'unfold' option to the Mask window, and fix up some allignment/font issues.
*   Update the Spelling file with Uwe's 2018 update.
*   Pressing 'End' key moves to end-of-variation (if in var) instead of end-of-game.
*   Minor Book Window fixes - enable undo, remove the arrow buttons (use wheelmouse instead), and properly name and document the 'Other Moves' button.  
      
    
*   Analysis Engines: pressing keys 1 to 5 sets PV.
*   Set undo point when marking squares.
*   Remove Suggested Moves feature.
*   Update Gregors tktext patch to current (2018-08-13).
*   Xboard protocol fixes: setboard should come after analyze, send 'nopost' to xboard engines in comp mode, and acknowledge 'my move' in analysis, as sometimes xboard engines (scidlet) dont send any other infos.
*   Relocate a couple of colour option menus to their proper windows (Crosstable and Score Graph).
*   In PGN import, handle the case when there are two comments for a single move.  
      
    Bug fixes
*   Fix serious built-in-engine and PGN-import errors.
*   Tree - the greying of the tree moves (if the progressbar is hidden) disabled the tree mask's move colouring.
*   Disable gamelist flag/delete menus if read-only.
*   Mate in N fix and hardening.
*   Ignore Country names if they dont look right in the gamelist and database sort.
*   Disable MS Windows screenshot feature (broken in Tk).

### Scid vs. PC 4.19

*   New 'Default Databases' feature (Options->Save Bases as Default).
*   CQL 5.2 search feature (Search->CQL). Thanks Lionel and CQL authors.
*   General search can now match any (non-hidden) pre-game or final move Comment.
*   Export Scid Flags feature.
*   Big speed up for bulk Strip Comments/Variations feature. (Also make the 'Stop' button work).
*   Improvements to loading games at the correct position (resolve a conflict between the tree window and search results), and small Tree speed-up.
*   Remove 'Magnetic' for Paul's chess pieces. New 'Ascii' chess pieces (thanks HGM) and 'Green' colour scheme.
*   New Turkish translation (thanks Ali Sen).  
      
    
*   Right-clicking button bar changes, including right-click Window button shows Splash window.
*   Some tree tweaks and doco updates, and tree Fast+Slow mode now doesn't break the win/lose graph.
*   Tweak progress bar update frequencies (base export, game copy).
*   OS X has a faster build.
*   New Windows build system from Oz.
*   A new script, 'sc\_filter\_pgn', which filters multiple PGN files for games matching a certain position.
*   FICS - Offers Graph is disabled while playing a game. Change the censor button a little, and control+censor censors person chatting to you.
*   Escape key in main board cancels piece dragging/move.
*   Input engine fixes (DGT board). Widget now resizes ok, and bitmaps display properly on OS X. Thanks to Davy De Roeck for debugging it on OS X.  
      
    Bug Fixes
*   Fixes regarding other language piece letters.
*   Fix up showing the first gamelist/game in searches.
*   Fix up the days of the months in the calender widget.
*   Fix up window placement on multi display desktops.
*   Best games 'Reset Column titles' was broke.
*   sc\_game startPos segfaults if !HasNonStandardStart.

### Scid vs. PC 4.18

*   New Best Games widget, similar to the Gamelist.
*   Score Graph now highlights the current move.
*   New annotation feature: Show missed/shorter mates.
*   A little new Gamelist button to reveal hidden/squeezed buttons (finally!).
*   The GameInfo Window has a right-click menu, and other minor menu changes.
*   Basic support for horizontal scrolling (in gamelist, crosstable and bestgames) for mousewheel buttons with horizontal capability..
*   Finnish translation, from Mika Kaakinen.  
      
    
*   Engines: if an engine shows a Mating line, show the whole line in analysis window, disregarding Max-Ply variable.
*   Don't show an error message when importing null PGN tags... too verbose.
*   Fics: try to handle case when move is made after run out of time. (We don't want to mark the game as out of sync).
*   Minor Translation, Mask and Fics tweaks.
*   Hide Board resize buttons in docked mode if auto-resize is enabled.
*   Revert Control-b binding to Book window.
*   Focus the text box of Comment Editor when raised.
*   Show a busy cursor when backing-up databases in the finder.
*   Game Save: also use previous Round with the 'Use Previous' button/feature.
*   Running Engine 1 in the statusbar needs special handling if using docking, as it cannot be withdrawn properly and was confusing before.
*   Show correct position in the pgn window after adding a new var/move.
*   Show PGN scrollbar by default.  
      
    Bug Fixes
*   Redock Windows after they have been undocked then destroyed. Before, such windows were remade undocked, and \*without\* menus.
*   Keep comments when truncating game from start.
*   Fix broken 'Copy' button in Engine's config window.
*   Promoting variations didn't handle precomments.

### Scid vs. PC 4.17

*   Analysis/Engine window.
*   \* Show checkmate/stalemate messages instead of sending 'no-move positions' to engine.
*   \* In engine configuration window the 'Date' field of an engine is now its exe modification time (mtime).
*   \* Speed enhancements for processing UCI engine moves (pv).  
      
    Gregor's improvements to the player and tournament finders (which Shane never implemented properly).
*   \* Previously - only the \*first\* 50 tournaments were used (eg) when looking for the 50 tournaments with most players.
*   \* Compilers must now support c++0x / c++11.  
      
    
*   Custom player photos (Place correctly named gifs in $HOME/.scidvspc/photos or bin/photos).
*   Resign button for playing UCI engines and Phalanx, analog clocks can now be hidden ('x' button in the white clock), and add the 'Skill Level' to the pgn header (eg - as used by Stockfish).
*   A patch to include Gregor's tk::text improvements.
*   New Chess 960 patch! Thanks to Britton Farrar, who now has a project at https://github.com/brittonf/scid-vs-variants.
*   New 'Under Promotion' search item in General Search.
*   Computer Tournament: when 'First engine plays others', flip board to show games from first engine's view.
*   Flip game browser if matches myPlayerNames.
*   Clipbase game limit is now 5,000,000, and game undo buffer is 20.
*   Chess Pieces: remove 12 piece-set limit, and adventurer and kingdom pieces. Reinstate old Merida1 as Merida3.
*   Row colour is now configurable for Player/Tourney/DB finders and Crosstable rows.  
      
    Fics
*   \* Offers graph is updated in a better manner.
*   \* Save game and add message disconnected while playing.
*   \* Top three buttons are now configurable.
*   \* Add a 'follow+' command, which automatically saves followed games.  
      
    
*   Tweak Find Best Move feature, which now also recognizes non-standard starts.
*   Game Save dialog: extend use of 'Use prev tags' to 'Use previous' (for Names, Site, Event, Elo, dates).
*   Switcher - replace readonly foreground color with a '(readonly)' message, and add a 'Confirm Copy' option menu.
*   Disable tree updates while annotating games and computer tournament.
*   Tree: Instead of having a 'stop' button, grey the tree text when updating (if progressBar is hidden).
*   Change a few shortcuts. control-b board colours. control-B setup board. control-G general search.
*   Control-TrialMode button, automatically adds a null move, and tweak the trial mode button pic.
*   Gregors namebase hardening.
*   PGN Import now converts any empty Name/Event/Site/Round tags to '?' (according to pgn standard, these should not be empty).
*   Minor fixes for Setup Board.
*   Allow Merging Games with non standard starts.
*   Bind pressing 'vv' keys to enter first variation.
*   Remove Crafty specific command 'mn', and it seems unsupported in Crafty 25.
*   In the tree window, when deselecting "Adjust Games", we now keep the current gamelist/filter.
*   Make hideNextMove non-persistent.
*   Right clicking 'Exit Var' button will exit all vars.  
      
    Bug fixes
*   Fix a nasty memory leak (in PgnParser).
*   Fix name counts when using globbing in the name editor.
*   Fix Mate-in-N (Tactics) bug.
*   Some charsetconverter (internationalisation) fixes from Gregor.
*   Removed xdg-open for opening URLs which just doesnt work for me.
*   Tree info button (short display) was broke.
*   Bugfixes for compiling on some linux platforms (including Raspberry Pi 2).
*   Some clock fixes. Digital clock was busted (counting up). CompTournament clocks are now digital only.
*   Stop tacgame/phalanx from failing to restart.

### Scid vs. PC 4.16

*   New Checkmate/Stalemate general search option.
*   Make fics premove work properly, and with promotion.
*   New Switcher menus to Open Tree/Best Games/Change Icon, and negate any open base filter.
*   The Best Games window can now be unsorted (on ELO).
*   Tree window has a short-display option (default is on).
*   New Merida1 piece set with large sizes (from Richard).
*   Change the colours of switcher current-base and book/book-tuning/tree next-moves.
*   Update all latex export features from Chess12 to the modern Skak (author Richard Ashwell) and add Latex previews for game exports (linux only).
*   Some Opening-Report and Player-Report fixes, and fix the Opening-Table options window.
*   Show the custom flag names in the statusbar.
*   Player Info: Add an extra 'Filter Games' hyperlink.
*   Tournament finder: Change behaviour re showing tournament crosstable.
*   Portugese update from G. Silva. Spanish update from Benigno.
*   Add 50 move draw detection to Phalanx and UCI computer games.
*   And new fics 'smoves+' command stores move-time (%emt fields).  
      
    Bug fixes
*   Export PGN bugfix introduced in 4.15.
*   Properly handle OpenRecentAsTree, if base is already opened.
*   'Round' wasn't getting shown in the gameinfo if Date was unset.
*   Annotation: try to handle zero move games.
*   Work aroud for occasional Tcl issue which affects piece dragging.
*   Game Save dialog didn't have translations.
*   Remove a heap of compiler warnings.
*   Tournament finder was showing incorrect number of games.

### Scid vs. PC 4.15

*   Engines
*   Limit engine ply option.
*   Bind Control+Enter to add whole line.
*   Tweak variation creation to avoid occasional var staggering.
*   Show 'Ponder' as a UCI configuration option (now that engines may play with Ponder on).
*   For the addmove button '+'. If move exists, just move::Forward.  
      
    Annotation
*   Options for the score format (which allows them to be hidden in the PGN window).
*   When finished annotating game, move to last move (instead of sometime staying at second last move).
*   Dont show out-of-book messages for non-standard starts.
*   Use-book feature didn't work under certain condition.  
      
    Gamelist Window
*   Columns can now be reordered, hidden, or right/left alligned (right-click column titles).
*   Replace the Flag button with context menus.
*   Left/right keys scroll the gamelist view.
*   'Merge Game' menu item (patch only).  
      
    Tree
*   When deselecting 'Adjust Filter', make the current adjusted filter remain.
*   Fix up a few tree translations/text formatting issues.
*   Option to show/hide the progress bar. (On OS X, the progressbar makes searches much slower).
*   Fix unusual coredump closing unused tree.  
      
    Spelling
*   Make Spellcheck interuptible, and remove limit of 2000.
*   Update spelling file against Franz' June 2015 release.
*   Skip spelling date check if game has no date.
*   Tweak AddEloRatings feature to work properly with FIDE rating data newer than 2012.
*   Don't ask confirmation of spellchecking clipbase.  
      
    UTF-8 support (from Gregor)
*   Databases can now be exported to PGN using either UTF-8 or Latin-1 character sets.
*   Detect correct charset of imported pgn and convert all to utf 'Avoiding a mix of character sets inside a database.'.
*   Support for ChessBase proprietary character set in PGN header.  
      
    FICS
*   Add flip-board buttons to the mini observed games.
*   Add a 10 minute line to offers graph.
*   Hack to destroy the results messageBox if we are being 'rematched' or challenged.
*   Unhide fics boards when a new observed game is announced.
*   New takeback code (better, but needs more work).
*   Add a 'Time' tag.  
      
    Computer Tournament
*   Remember selected engines when changing number of engines.
*   Use new is-check routine for stalemate detection (sc\_pos analyze could cause core dumps).
*   Change the tournament per-game time controls from min/secs to secs/secs (base/incr).
*   Don't add time increment for in-book moves.  
      
    Translations
*   Update for French from Dale Cannon.
*   Minor Portugese update from martinus.  
      
    Player Info
*   Player Info history feature (right click window).
*   Add 'Total' separators to the playerinfo stats.
*   Filtering opponent games wasn't working if tree open.  
      
    Bug Fixes
*   MS Windows - preempt/fix possible db compaction failure due to inherited engine file descriptors remaining open.
*   OS X Board Options colour buttons were not coloured.
*   OS X and maybe win32 - game import wasn't automatically pasting the text copy buffer.
*   The pgn middle-button board popup could rarely be placed off-screen.
*   Fix occasional (but annoying) bug regarding game truncation and variations.
*   Creating a new database - board wasn't getting refreshed.
*   Browsing a game - autoplay didn't stop straight away when requested.
*   Some EPD fixes. Notably - auto save position.  
      
    Also
*   Minor Compact database fixes; create a new game when compacting db (instead of leaving the current game as game 0, which is confusing), and ask for SaveGameChanges before compacting.
*   Autoplaying multiple games - pause at each game end.
*   Database switcher uses font\_Tiny, so handle/resize this font a little better.
*   Usual Help updates, including add a help button for the NAG window and Correspondence Chess / Xfcc / email help update.
*   OS X hack to activate shortcuts keys when wm gives app focus.
*   Setup board should always start with the current position.
*   Try to make all base filenames absolute, hoping to fix duplicate file history entries and db opens.
*   Add a string length validation procedure, and use it to limit Custom Flag entry boxes to 8 chars.
*   Dont reload last/first game if already active.
*   Gregor's qsort implementation for player finder sorting (sc\_name plist).
*   Bump player/tourney finder defaults.
*   Make tournament finder respect EventDate tag.
*   Patch to always load last game (ignoring base autoload).
*   Bind Control+Wheel to font resize in the player and tournament finders.
*   Merge game: move the merge game comment to the start of variation, and simplify comment.

### Scid vs. PC 4.14

*   Tree Mask
*   Mask auto-load option
*   Automatically add move to mask instead of showing silly error message.
*   Holding Control while opening the Mask context menu (marker/nags/color) adds a marker to the whole line (etc).
*   Make Mask moves easier to see, and tweak menus.  
      
    Board Setup
*   Enable piece dragging
*   Flip the setup board if main is flipped.
*   Make 'Clear Setup board' have Kings.  
      
    Searches
*   Add End-Position-Only option to Material Search.
*   Knight+Bishop sanity check was wrong, and we werent saving Knight+Bishop joint totals in saved searches.
*   Tweak the other-base combobox in Board Search.  
      
    Fics
*   Double clicking an observed game makes it your primary game (number is shown as bold)
*   Refine Offer Graph layout (most games are short), and add a close button (previously was only escape key)
*   New 'Censor' button (+censor opponent)
*   Add a show/hide buttons feature
*   Control+Wheelmouse alters Fics console font size.
*   Only save games a few moves long.  
      
    Computer Tournament
*   Automatically adjudicate in simple cases of insufficient material.
*   Make the window more ergonomic
*   Fix ponder not working with non-standard starts.  
      
    Game Information
*   Comments now have their own line, and move some infos to the Statusbar
*   When Gameinfo is hidden, make the mini Player Names clickable.  
      
    Book Tuning
*   Add/Remove Line features
*   Clicking on Book Tuning next move (in yellow) moves forward.
*   Bugfix - truncate the polyglot books when using Remove Move.  
      
    Score Graph
*   Remove the errant rounding up of +10 to +11 in y-axis, and raise border over graph bars
*   Add backGround colour to graphs
*   Middle button pops up the game position for any move.  
      
    Other
*   New Portuguese translation from R. Silva (martinus at FICS)
*   Update to Phalanx XXIV. The Tactical Game feature is a proper challenge now.
*   Place Best Games window beside Tree window (in docking mode).
*   Playerinfo: still show Bio info (if available) when there are no games in database.
*   Automatically add the final move if adding a var at game end with the AddVar button
*   Minor improvements for html/html+javascript Game Exports
*   Set filter to deleted games prior to compacting game file.  
      
    Documentation
*   Document how to alter the Game List fields
*   Update OS X build notes.
*   Update chess960 patch (no code changes), and document known issues.  
      
    General Bug-fixes
*   Xboard engine annotation was ignoring 'Use Book'.
*   Correspondence chess tls/encryption bugfix (Alexander)
*   Properly flip comment editor board (if applicable) and other tweaks
*   'Find Best Move' feature was broke
*   When saving game, throw error for badly formed extra tags (instead of silently discarding).
*   When adding a var to end of game, make sure to auto enter \*this\* variation, in case of vars already existing
*   Exit trial mode when changing bases.
*   Gamelist sort confirmation column-name was not translated.
*   Change move overwrite behaviour of eco browser and Opening Table moves.
*   Remove superfluous padding from OS X aqua theme

### Scid vs. PC 4.13

*   Analysis Engine: exclude move(s) feature. Mouse-hover shows excluded moves (UCI only).
*   Analysis Engine: button to pop-up unrevealed buttons, and redo a few icons.
*   Maintenance: Bulk strip Comments/Variations.
*   Depth-based Engine Annotation improvements.
*   Tweaked key bindings (including FilterReset Control-r and GameSave Control-s).
*   Improved Background Colour feature.
*   Add 'Find' entry boxes to more windows (including spelling corrections) , and widget can now use regular expressions.
*   Splash widget console now has a simple command history (up-arrow).
*   Better Repair Base feature (from Gregor).
*   Include Gregors fast file opening with the windows 32-bit binary.
*   Bind Control-Wheel to alter fixed font size (in some windows).
*   New Russian translation (from Sergey Nikolaevich Koyankin) and updated German one (from surrim).
*   Enforce all tags (eg Event names, etc) to be less than 256 chars.
*   Tweak Scid's Linux installer is to properly allow custom SHAREDIR.
*   Windows drag and drop file open wasn't being init properly.
*   Better handle language translations/encoding.
*   Crosstable: bump max-player limit, tweak menus and bind right-click to menu, fix occasional allignment bug, and dont' automatically update (fixing busy cursor bug).
*   Bump Opening Table limits, and minor bug-fixes.
*   New (Skak) Latex export-games feature (author Mark Dennehy).
*   Update Xfcc to handle secure connections (thanks to Andrew Hunt).
*   Fix minor memory leaks, and dont slow game file compaction (we now reset filter).
*   Bestgames has a game load menu instead of 3 buttons.
*   Refine docked window drag and drop.
*   Many minor OS X tweaks.
*   Trim whitespace from name fields in game save dialog.
*   Add whitespace corrections to spelling.ssp, and also tweak Event spelling corrections.
*   Tooltips for the obscure buttons in main buttonbar.
*   Analysis add move as 'New Mainline' was broke.
*   Always get confirmation for sorting via gamelist.
*   Enforce illegalilty of saving Event Date without Game Date.
*   Phalanx updates and minor tacgame, sergame fixes.
*   Make a few windows have small font buttons.
*   Shift+Wheel(/ left-right wheel) scrolls a few widgets horizontally.
*   Break up the long Book Tuning button menus.
*   Many minor bugfixes and further tree-only filter fixes.

### Scid vs. PC 4.12

*   Gamelist/Filter fixes. Filter works better with Tree.
*   New Crosstable tie-break options and reorder Crosstable menus.
*   Game-result is now shown alongside Player names, at top of GameInfo window.
*   Middle button in main board toggles game info.
*   Databases open faster (Linux/OS X only - "avoid the time consuming file locking". Windows is in testing).
*   Allow dragging Docked Window tabs to alter their order.  
      
    Gamelist button/menu changes:
*   Flag button is now context menu, Gamelist Save is moved to tools->export, Find button removed (use enter in Find entrybox)  
      
    Spelling changes:
*   Update spelling file to a custom version of Franz's Jan-5-2014 spellling.ssp.
*   Spell-checking can now remove GM, IM, FM, CM, WGM prefixes from player names.
*   Doing player-name replacements, show how many fail due to age/date considerations.  
      
    FICS changes:
*   Add user-configurable init commands.
*   Board size slider is now a menu.
*   Game Offers pack over buttons (making it less crowded, use escape/button-2 to cancel).
*   New find entrybox to search the console.
*   Remove Clear button (as getting crowded).
*   Remove the never used big clocks.
*   Add start, end sounds (and minor sound fixes - though still buggy).
*   Dont save FICS aborted games.
*   Disable engines when playing a FICS game.  
      
    Analysis and Annotation changes:
*   Make 'scoreToMate' work better and faster, which stops occasional incorrect Mate-in-N lines showing up, and works better at near-mate positions.
*   Make the Annotation config window fit on small displays.
*   Stop engine at end of annotating a single game.
*   Try a new approach to Depth-based annotation, which works better, but still needs fine-tuning.  
      
    
*   Spanish translation update from Igor Sosa Mayor.
*   Polish translation update from Adam Umiastowski.
*   Add a find entrybox to the splash window
*   Strip PGN Tags improvements
*   Right-clicking toolbar Game-Save icon quick saves game.
*   Sound devices can now be selected; mainly useful for Linux systems
*   Dont insert newlines into PGN copied to text buffer... Some web PGN browsers don't work with newlines following movenum. eg "10.(newline)Nxc3"
*   Save game history when Scid quits
*   Remove tree status bar. Same info avail in switcher and tree text widget.
*   Booktuning nextmove is now highlighted (same as Book), and padding has been tweaked a bit.
*   Move Maintenance menu from File to Tools menu
*   Remove the annoying " from myPlayerNames.  
      
    Bugfixes:
*   When saving PGN to file, disable translating pieces. (Export to PGN was already this way).
*   FICS Digital clocks didnt appear under some circumstances
*   Undo/redo refinement/fix for when buffer has been full
*   Fix import issue - Sometimes first tag is lost (If UTF byte order mark is present)
*   MSWindows - Board keyboard bindings are were getting lost after Variation window popup is dismissed.
*   Some tooltip refinements, including removing tooltips with board update (mask tooltips were erroneously persistent).
*   Tablebase window: Results Board was not getting packed (is now below Results Frame). Change the damn awful red, update help, give tbWin the widest paned window.
*   With wish8.6, we cant close undocked windows with a Close button. Fix
*   Some fixes for javascript and html game exports
*   Correctly handle plain text crosstables.

### Scid vs. PC 4.11

*   Maximum board size is now twice as big
*   Gamelist context menu (right-click). Less button crowding
*   Annotation improvements: Depth based annotation, and cut-off features
*   Dock a few extra windows (graphs, tablebase)
*   Computer tournament stability/speed fix
*   Locked Analysis Engines now show the locked position (not the working line) , and bug-fix the engine lock, which didnt work properly
*   Add a low CPU priority check box to Engine Configuration window (especially important for MS Windows - where engines can kill GUI)
*   Engine configuration window now repsonds to keystrokes to quickly find any engine
*   Display "(altered)" in statusbar is game has been changed
*   Fullscreen menu item (Options->Windows->Fullscreen)
*   FICS tweaks, including over-riding takeback/abort request dialogs when game ends
*   Remove some wasted space around FICS, main button bar, and other widgets
*   New Greek translation
*   Read custom chess pieces from  /.scidvspc/pieces
*   Docked tabs/menu refinements
*   OS X - Clicking on URLs will open the link in a browser
*   Add a command console to the start-up window
*   Bug-fix: Fix main board rendering anomoly in docked mode with MS Windows
*   Bug-fix: When tree is open, gamelist filter operations didn't work properly
*   Bug-fix: Search in variations never matched positions at end-of-line
*   Bug-fix: Opening Table favourites werent working properly
*   In Export PGN dialog, add an option for "Space after Move Numbers"
*   Keyboard short-cuts changes. Control-L (etc) no longer open/close, but open/raise
*   Tweak Comment Editor and Player Info buttons

### Scid vs. PC 4.10

*   When sorting databases, don't reset filter and remember current game/gamestate
*   Game history menu
*   Implement (and bugfix) SCID's more comprehensive NAG framework
*   Change a couple of field orders in the gamelist, remember field widths, and remove the icon context menus from the switcher (middle click now toggles show/hide the database icons)
*   FICS: Allow use of alternative URLs (used during FICS outage) and other minor tweaks
*   Window focus improvements (mainly for MS Windows and OS X)
*   Computer Tournament: add 'Engine Scores as comments' option, and make some minor global/:: var changes
*   Add Book Tuning to dockable windows
*   Automatically flip board (if applicable) in game browser and analysis miniboards
*   When diffing twin games, ignore newlines in the comments, which make diffing impossible
*   Add undo points for user generated addNag events
*   Bookmarks: add a few key bindings (delete/up/down), and shuffle the gamelist bookmark button up one row
*   Drag and drop hardening
*   Windows 7 bugfix: PGN export and Progress bars weren't working in undocked mode
*   Translation framework updates. Overhaul Dutch translation, and remove (broken) Russian one
*   Convert braces '{', '}' to '(',')' when exporting PGN comments (against PGN standard). Also tweak various PGN help topics

### Scid vs. PC 4.9.2

*   OS X changes, including docked mode fixes

### Scid vs. PC 4.9.1

*   Fix promotion bug in non-docked mode
*   Small pictures allign top/bottom in game info
*   Clickable crosstable columns
*   Make an undo point with Setup Board, and disable undo for Trial mode
*   Add Tournament lookup to Player Info window
*   PGN import window was not getting mapped

### Scid vs. PC 4.9

*   Window Docking feature - Different windows are docked/restored than Scid. Five layout slots with three custom layouts. Bug-fixes. F11 for fullscreen. Tcl-8.6.0 may have issues. Selectable Ttk themes (also for Gamelist)  
      
    General
*   Move search feature (eg 'h6 Bxh6')
*   UCI: replace 'position fen ...' with 'position startpos moves ...' for general analysis
*   Better Twin Games Checker - highlights missing comments and variations in duplicate games
*   Windows has a MSVC makefile (Makefile.vc) and includes Stockfish 2.31 (JA legacy build)
*   Fix windows stack problem (hopefully)
*   Text Find widgets in help, crosstable, engine logs
*   Game Save dialog remembers any custom tags you add to a game, making them easy to recall
*   Restore drawing arrows and marks from the main board (also used by FICS premove)
*   Arrow length/widths configurable via comment editor
*   PGN Figurines now display in bold, and a different font, if applicable (from Gregor)
*   Some new board textures (from Ed Collins)
*   Automatically save "bitmaps" directory when exporting to HTML
*   Player info window shows Photos in a scrollable canvas insead of stuck in top right corner
*   Delete key deletes moves in game/variation after the current move
*   Score Graphs are now bargraphs instead of lines
*   Bind statusbar->middle button to 'switch base'
*   FICS context menu, game offers now show more information, and premove
*   FICS: deiconify/raise window when game starts (nodock mode only)
*   FICS: stop clock when we make a move (even though we may not have acknowledgemnt from FICS about move)
*   FICS: 'upload' command for uploading local games to FICS examine mode
*   Allow the Name editor to glob '\*' for Site, Event and Round fields (but not for 'All Games', too dangerous when used by mistake)
*   The material board can display \*all\* taken pieces
*   Gamelist button rows can be hidden by right-clicking the list, and it has a game save icon
*   Right click V+ button adds the second variation
*   Windows analysis engines no longer run at low priority
*   When annotating the score on blunders, show the main score first, var second (eg: +1.00 / +2.50)
*   Add programmers reference to the help contents/online doc
*   Bind space-bar to engine start/stop
*   Update twic2scid.py script
*   Remember if .board is flipped for each open base  
      
    Bugfixes
*   Make the database switcher icons/frames get smaller if they are cramped (so we can see them all)
*   Half fix UCI game (sergame.tcl) time issues
*   Corrospondence Chess now works
*   Tree Mask bugfix: Checks couldnt be added to mask
*   Fix Tree 'Fill cache with game/base' feature
*   Try to handle shortened FENs with Paste FEN
*   Crosstable: 'Set Filter' now includes deleted games if +deleted
*   Crosstable: handle games with a year-only date differently for crosstable purposes (Instead of +/-3 months, match any other games in the calender year
*   FICS: Stop clocks after a takeback request from opponent
*   FICS: Games with move lengths greater than 1:00:00 would break parse
*   Add missing FICSLogin translation
*   New windows Phalanx build. It works better under win7, but has analysis polling issues
*   OS X: pad out flag buttons in Header search
*   base\_open\_failure was erroneously closing wrong base
*   Windows Preview HTML for Reports is fixed

### Scid vs. PC 4.8

*   Drag and Drop file open(s) on Windows and Unix
*   Custom background images (jpegs, gifs and pngs)
*   Random sort pgn feature
*   Crosstable now have +/-/= subtotals
*   (and Player Stats format changed from +/=/- to +/-/=)
*   General PGN search has ignore case option
*   Board Search gets it's combobox updated when DBs are opened and closed
*   Save game before PGN Import
*   Save game: enable the use of 'prev game tags' for existing games. This allows easy addition of the same tags to consecutive existing games
*   Remove the 'Scid: ' prefix from several window titles
*   Update some translations
*   Show Linux version/distro in the startup window
*   Add a patch to make toolbar buttons raise only (instead of toggle open/shut)
*   Add a patch for Chess960 support (from Ben Hague). Unfinished  
      
    Analysis
*   UCI: properly handle UCI buttons. Previously they were invoked at every engine restart
*   Right clicking 'Add Var' button adds Engine Score comment only
*   Replace ponder on/off with hard/easy for xboard engines
*   Super quick engine infos can happen before Scid's PV is inited properly. So we have to default to PV = 1
*   Allow xboard engines to use lowercase 'b' for bishop promotion (eg a7b8b)
*   Don't send an erroneous 'isready' (with 'uci') to quiet analysis engines
*   Right clicking the widget allows to disable line wrapping
*   Don't add a line to analysis history if moves are null  
      
    Tree
*   Move ECO stats to the end of line
*   Several Mask refinements - notably Searches are much more readable and previously clicking on searched lines didn't work
*   Fix up minor bugs about castling moves (OO, O-O, O-O-O)  
      
    Computer Tournament
*   Computer Tournament Book feature
*   Dont' kill tournament if engine crashes
*   Only pack the first 10 engine combos (which allows for big tournaments)
*   Fix up Xboard time/move command order. Xboard engines should behave much better
*   Various other tweaks  
      
    Gamelist
*   Show altered games in red
*   Control-wheelmouse scrolls up/down one page
*   Switcher now has text on two lines (if icons are shown)  
      
    FICS
*   Digital clocks now (optionally) on the main board
*   Better integration of FICS "examine" and "observe" features
*   FICS has it's own options menu
*   bind F9 to xtell instead of tell
*   Change the move.wav sound from tick-tock to a short click  
      
    OS X
*   Filter graph bugfix
*   Material Search properly shows the little buttons
*   Copy and Paste text from disabled OSX text widgets (engines, help, gameinfo)
*   Buttons 2 and 3 are swapped around  
      
    General Bugs
*   Work arounds for wish 8.5.12 and 8.5.8 issues
*   Analysis logs can badly break autoscroll, so use normal frames and scrollbars
*   Handle PGN parsing of unspecified promotions (b8 becomes b8=Q , for eg)

### Scid vs. PC 4.7

*   Tree: Add coloured bargraphs representing win/draw/loss (and remove the old tree graph)
*   Tablebases: Make best tablebase moves clickable
*   Tablebases: tidy up config , main window and help items
*   FICs: Can now play and watch (observe) multiple games at the same time
*   FICS: Support loading old/interupted games for analysis (using 'smoves' command)
*   FICs: Add an Abort button. Other minor fixes
*   Serious Game overhaul (though still has minor issues) Add pause, resume features and mate, game drawn dialogs
*   Computer Tournament: Add 'first engine only' feature for testing a single engine against others
*   Enable material difference display for game browser and fics observerd games
*   Analysis: View engine logs from within Scid, and can also disable logging
*   Analysis no longer word wraps, and uses fixed font
*   Analysis: add a xboard/uci protocol column to the engine list
*   Include updates to SCID's spellchk.c, improving the ELO add-ratings feature
*   Update spelling.ssp file to Jan 2012, and include with windows
*   Player info: clicking FIDE ID opens relevant url
*   New feature: 'Search->Filter to Last Move'. All filter games will load at the last move (end of game)
*   Refine the Calculation of Variation (Stoyko Exercise) feature and Help
*   Toolbar has a 'book window' icon
*   Tweak PGN context menu: reorder the Strip/Delete move items
*   Gamelist: replace the Negate button with a Select button
*   Tree: Include a patch for embedding the Best Games into the Tree window
*   Analysis: Revert Lock engine changes. Previously, lock engine would also start Trial Mode  
      
    Bugfixes
*   Importing PGN, check that Promotion Moves are long enough (otherwise can segfault)
*   Document CCRL pgn round name problem, and handle errors better when Name limits hit
*   FICS: remove non-ascii chars from commands if using timeseal
*   Gamelist: To display unusual characters, convert to unicode before displaying games
*   Sync html bitmaps with SCID
*   Book: Only do the second book move lookup if we have too. (slight performance boost)
*   EPD: Quick fix for epd analysis annotation bug
*   Hungarian, Swedish and Potugese Spanish were broken if Piece translation enabled (which was default). Fixed
*   Fix up Tacgame score-isn't-updated bug

### Scid vs. PC 4.6

*   Undo and Redo features (partly from SCID)
*   Microsoft Windows has a proper installer
*   Always loads games at the correct game ply when using the tree and searches
*   Ratings graph can show multiple players (and there's a minimum ELO feature)
*   Computer Tournament: Improvements for both Xboard and UCI engines, and implement the 50 move draw rule
*   Auto-promote feature for FICs
*   Book tuning 'Remove move' feature
*   Autoraise button raises all windows
*   Annotation improvements, and it is now possible to score All moves while only annotating Blunders
*   Known aliases Biographical data is shown in the player information window
*   The player info widget has buttons enabling quick player renames and look-up
*   'Read-Only' context menu to the Database Switcher, and Read-Only bases are greyed out
*   Fix bug in the opening/theory table
*   Remember game position when stripping comments and variations from PGN
*   Change analysis colors for MultiPV to black/grey instead of blue/black
*   New 'Search in (other) Database' feature to the board search (from SCID)
*   Variation/Mainline arrows can have custom colours
*   Crosstable can (optionally) show 3 points for a win
*   Fix sc\_remote (which allows games to be opened in an already running Scid vs PC)
*   Phalanx tacgame bug-fixes (play brainy, and stop after the correct amount of time)
*   Tweak the best games widget (make fields line-up)
*   When handling Import PGN errors, show the game numbers as well as the line in file
*   Catch a nasty wish8.5.10 bug with the gamelist (Wish-8.5.10 should be avoided)
*   Remove the broken integer field validation and replace it with something that allows backspace to work
*   Bind Control-Tab to 'switch to next base', and Control-(quoteleft) to 'switch to clipbase'
*   Fix a couple of corner cases concerning dates and searches
*   Analysis widget : small speed improvements , icon changes and bug-fixes
*   Add a help item for Maintenance 'Check Games' feature
*   Swap around the 'Next Move' and 'Event' game-information lines
*   New documentation about making Polyglot books
*   Make the player Report config widget a bit easier to use
*   Catch a nasty wish8.5.10 bug with the gamelist (Wish-8.5.10 should be avoided)
*   New OSX HowTo
*   Crosstable bugfix: the 'show white first' feature didn't work for two match rounds
*   Update 'Tips'
*   Clarify Scid's maximum number of games
*   Update Spanish and Polish translations
*   Update FICs , PGN and Menu language translations

### Scid vs. PC 4.5

PGN Window:

*   PGN chess font support (but font installation on Windows isn't great)

Computer Tournament:

*   Per-game time control
*   Clock widgets for remaining time
*   Manual adjudication buttons, and a Restart button

General:

*   Game List remembers it's view when switching between bases
*   Game Browser has new buttons and functionality
*   Tournament Finder is more readable
*   Restore PGN scrollbar (pgn option)
*   Phalanx now reads enpassant and 50 move field from FEN (thanks Bernhard Prümmer)
*   FICs console fg and bg colours are now configurable
*   Name Editor tidy up and documentation review
*   Player Info: add a 'Refine Filter' result group
*   Typing 'OO' castles (previously only 'OK','OQ')
*   Mask Search widget fixes
*   Annotation: Dont add nags when annotating score. Don't repeat previous nag if annotating all moves
*   Crosstable shows current game in green
*   Use translations for Game List column titles (if available)
*   Add a 'Game Delete' menu
*   Improve ./configure and Makefile, and CC FLAGS are propagated to all targets
*   Game Save autocomplete now uses mouse instead of clumsy keyboard bindings
*   Restrict Game List sort to valid columns, and add a 'confirm sort' widget for bases > 200000 games

MS Windows tweaks:

*   Windows Crosstable transparency glitch is fixed
*   Fix wheelmouse support in a few places
*   Add a 'make-scidgui.bat' hack for assembling a new 'scid.gui' from subversion
*   Computer Tournament buttons padding fixed

OSX:

*   Make an OSX app with a working ;> version of Tcl (thanks Gilles)
*   Many OSX wheelmouse and graphical fixes

Bug fixes:

*   Null move fixes including - analysis engines can append variations
*   Tree training feature fixes
*   Show Progressbar for loading bases with a dot (.) in their name
*   If Scid crashes, Game List could be left with zero size
*   PGN middle-click move preview feature fixed for variations
*   PGN text tabstops are now dynamic to allow for correct column allignment in column mode
*   Remember position of custom ecoFile if loaded
*   Change the second book slot to avoid conflict with Annotation feature
*   Catch unmatched braces in gamelist values
*   Fix 'Paste FEN' castling sanity check
*   Browser previously highlighted Next move instead of Current move
*   Fix scid.eco unicode bug
*   Remove 'newlines' from Mask Search results
*   When addAnalysisVariation fails due to bad moves, don't move back N moves
*   Theory table incorrectly started from start position

### Scid vs. PC 4.4.1

*   Fix nasty flicker bug when board is flipped
*   Fix fics bug that graph sometimes doesn't stop when new game starts
*   Add Burnett chess pieces

### Scid vs. PC 4.4

*   Implement SCID's interruptable tree processing
*   Implement SCID's custom flags
*   Gamelist is much faster for big databases
*   Add widgets to the gamelist for manipulating flags and browsing first/last/next/previous games
*   Opening Book and Book Tuning overhaul - allow two books to be opened with side-by-side sorting, and various interface improvements
*   Overhaul Annotate widget - allow choice of scores/variation/both and remember annotation options
*   Crosstable sort by Country feature
*   Update Fics to allow for different Port/IP Address (using SCID code)
*   Graph changes - remember widget settings, change colours+dot size, fix up half-move bug and a title misallignment, add 2010 decade
*   Fix up the global grab for progressWindow (opening databases)
*   Add "Half moves" (moves since capture or pawn move) to setup board
*   ECO Browser changes - add "update" and "up" buttons, when clicking on "Start ECO" open browser at top level, make statistics more readable
*   Add the "Last Move Color" to the main board colours widget
*   Restructure "Tools" menu
*   Icons - remove the large gameinfo and togglemenu buttons, add a "comment editor" icon to the toolbar and tidy up various icons
*   Busy cursor when sorting database via Gamelist column click
*   For OSX (esp. single button mice) - bind to context menu for main window and pgn window
*   Make the 'paste variation' feature work a bit better at var/game end
*   Make variation popup remember it's location instead of being centered
*   Add "Read-only" button to maintenance window
*   A nice PGN/htext performance tweak that smooths out large game edits
*   When using "-fast", perform fast database opens also. Otherwise, update the progressbar to show "Calculating name frequencies"(todo?)

Bug-fixes

*   Ubuntu 11 have put libX11.so somewhere stupid. Update configure script
*   Paste FEN bug involving fen validation
*   Fix promotion bug involving busy CPU and missed grab
*   Fix off-screen window placement on windows
*   On Macs, dont place the window at top of screen, as it's then stuck under the main menubar
*   Make the game save dialog center and resize properly
*   Fix up file loading (and bookmarks) of DBs with dots (.) in their name
*   Statusbar shows correct value after Crosstable update

### Scid vs. PC 4.3

*   Clickable Variation arrows
*   Paste Variation feature
*   Database Switcher has been moved to the Gamelist Widget (and has some new icons)
*   Gamelist can now perform logical ANDs in the search widget using "+", and include the date
*   Gamelist now has remove-above and remove-below buttons
*   FICs improvements, including a ping feature to indicate network health (\*nix only), and player communications are saved as PGN comments
*   FICs bug-fix: don't automatically accept rematches
*   FICs "Opponent Info" button
*   New Toolbar buttons: "Load First Game" , "Load Last Game"
*   Bookmark Widget has been overhauled
*   Analysis Engine's move history doesn't get spammed by "Mate in 1" (for eg) messages
*   An engine can now be run in the Statusbar
*   Allow engines to be reordered
*   Simplify the Bestgames Widget : Remove the PGN pane, nice-ify the widget, and enable graph and best widgets to remember size
*   Several interface speed-ups from Fulvio
*   Other SCID C++ changes from Gerd and Fulvio, including "Don't decode games when copying games"
*   Some Tree Search optimisations from SCID
*   Sort by number of Variations and Comments from Gerd
*   Help Widget has a search entrybox
*   Help Widget font size (and Pgn Window) can be easily increased by control+wheelmouse
*   When pasting FEN directly, do a castling sanity check
*   Bugfix: When user starts scidvspc for the first time, clipbase is left closed
*   Browser widget has a nicer button bar, and windows wheel-mouse bindings
*   Overhaul the Edit Menus
*   Numerous GUI fixes
*   Revert PlayerInfo to old format, but add a "Won Drawn Lost" header
*   Tweak crosstable knock-out format

### Scid vs. PC 4.2

*   New si4 database support
*   Include tree and mask improvements from Scid (excepting Fulvio's delayed tree code, which has issues)
*   Overhaul right-click menu and allow toolbar / menubar / statusbar to be hidden
*   Allow tournament games to start from current position
*   Easier 64 bit compilation
*   Include Scid's correspondence feature
*   Make analysis widget info properly hideable, and tweak buttons
*   Tweak game save forms
*   A couple of Mac fixes, including the broken gamelist widget (bad!)
*   Restructure game info widget - Player names are more prominent, Length field added, Colors made consistent
*   Reincluded Merida2 pieces
*   Remove Repertoire editor (same functionality via Tree Masks)
*   New Finder rename fucntion
*   PGN indentation fix (especially for comments)
*   Work around for batch annotation bug (still under dev by Joost)
*   Header search widget tidy
*   New icon

### Scid vs. PC 4.1

*   Quite a few FICs tweaks, including new help pages and D.O.S. attack fixes
*   Numerous Gamelist improvements (see below)
*   Tree widget improvements: next move is highlighted, main filter is now independant of Tree filter, wheel mouse bindings
*   Tactics feature fixed up: Renamed "Puzzle" , and Problem Solutions can now be browsed in-game
*   Analysis window "add variation" now \*appends\* variations if at var end
*   Comment Editor has undo and redo bindings
*   Main board grid colour can be changed
*   Setup board can rotate and flip the board
*   Clicking on moves in the gameinfo area shows Comment Editor
*   Better window raising/focusing
*   Kill analysis window after batch annotations
*   New marble tile theme and colour themes
*   Some menu re-ordering
*   Recent Files menu is basename only
*   Remove Control+V game paste binding .... too dangerous
*   Further refinements of Switcher widget and Icons
*   ttk comboboxes are no longer grey
*   Analysis widget scrolling will pause to allow backwards review
*   Splash widget changes, and remove pop-up for missing Bases and Book directories
*   Rewritten Help items  
      
    
*   Gamelist improvements -
    *   Field order rearranged
    *   Columns now sort in both directions, with arrow depicting direction
    *   Deleting items works better
    *   Can be sorted by ELO
    *   Draws sorted alongside no-result
    *   Delete and Compact buttons disable better
*   Bugfixes -
    *   Twinchecker PGN text diff-ing was sometimes broken
    *   Phalanx observes tournament feature time control
    *   Fix "Show Suggested Move" feature
    *   Fix occasionaly issue with erroneously selecting squares, then being unable to reselect them
    *   Ignore crafty's resignations which caused X-window flash events
    *   No context menu if dragging a piece
    *   RobboLito (and others ?) had uppercase piece promotion which occasionally broke
    *   "Show Suggested Move" was broken
    *   Gamelist sometimes left off the last or first item
*   Widget tidies -
    *   Analysis engine config widget
    *   Maintenance tweaks
    *   Game save widget made better
    *   Parent Date widget
    *   Delete twins
    *   Database Switcher changes, including new icons
    *   Finder now has three columns (and other changes)
    *   Player finder + Tournament Finder sub-widgets alligned
    *   Statistics window restructured

### Scid vs. PC 4.0

*   Computer Chess tournament feature
*   The Gamelist widget has been rewritten to work with huge databases. Other new features include a case insensitive search, deleted items are greyed out, and there's a "Compact" button to empty trash with
*   Add a background colour option that applies to many text widgets, including gameinfo, pgn window and help window
*   Restructured the analysis widgets, putting toolbar on top, tiny board at bottom, tweaking toolbar icons and reparenting analysis died error dialog
*   Update the book and book-tuning windows (untested, from SCID)
*   Add a new logo, and some wm title tweaks
*   Board Screenshot feature (Control+F12)
*   Bind mouse wheel to move progression (and widget resize) for the little browser windows
*   Change all comboboxes to ttk::combobox
*   Allow xboard lowercase promotion moves (eg while g7g8Q always worked, g7g8q previously failed)
*   Enable hovering over toolbar help pop-ups
*   Fix up analysis widget "lock to position" feature
*   All analysis windows can now use annotation, and autoplay feature
*   Bind F4 to start another analysis window
*   Various C fixes from SCID
*   Sync the tools::connect-hardware feature with SCID (untested)
*   When using the setup board widget, do a sanity check about the FEN's castling field
*   Some minor version fixes anticipating tcl8.6
*   Small bugfix: variation pop-up could previously throw errors if moving through movs fast
*   F1 \*toggles\* help window
*   Remove space-only lines from project - they mess up vim's paragraph traversal feature
*   Fics "withdraws offer" fix
*   Toolbar icons tweak
*   Allow databses to have "." in their name
*   Tactical Game stores game result
*   Set Game Info widget includes Site field
*   Small "update idletasks" in main.tcl improves main board responsiveness
*   Fix up the history limit of combobox-es (especially the setup board FEN combo)
*   UCI kludges for Prodeo and Rybka from SCID (untested)
*   Turn off craftys egtb (end game tablebook) for the analysis widget
*   Comment editor bugfix - unbind left/right from main board
*   Fix for matsig.cpp overflow (unapplied? , untested)
*   Key binding for first/last game is now Control+Home/End instead of Control+Shift+Up/Down
*   Perform a db refresh after importing PGN file(s)

### Scid vs. PC 3.6.26.1

*   Overhauling the tactical game feature
*   including a Fischer chess option
*   Overhauling the tools->analysis widget
*   Some re-organization of menu widgets, including tear-off menus
*   Rewritten board style widget
*   Fix parenting of some pop-ups, including the splash widget
*   Clock widgets placed side-by-side
*   Remember fics widget size
*   Last move displayed in bold

8. [contact](#toc8)
-------------------

[Scid vs. PC mailing list](https://lists.sourceforge.net/lists/listinfo/scidvspc-users)

[Stevenaaus](email://stevenaaus at yahoo dot com) is a uni graduate in math and computer science, who programs as a hobby in tcl/tk, bash and C. He lives and works in rural australia.

9. [links](#toc9)
-----------------

*   Scid vs. PC [http://scidvspc.sourceforge.net/](http://scidvspc.sourceforge.net/)
*   Project page [http://sourceforge.net/projects/scidvspc](http://sourceforge.net/projects/scidvspc)
*   Online documentation [http://scidvspc.sourceforge.net/doc/Contents.htm](http://scidvspc.sourceforge.net/doc/Contents.htm)  
      
    
*   Caïssabase database [http://caissabase.co.uk/](http://caissabase.co.uk/)
*   Player Information resources [http://sourceforge.net/projects/scid/files/Player Data/](http://sourceforge.net/projects/scid/files/Player Data/)
*   FICS [http://www.freechess.org](http://www.freechess.org)
*   FICS game archives [http://ficsgames.org](http://ficsgames.org)
*   Kayvan's Cross platform 'docker' images [https://github.com/ksylvan/scidvspc](https://github.com/ksylvan/scidvspc)
*   Chess Tech blog, with some ScidvsPC tutorials [http://chesstech.info/](http://chesstech.info/)
*   Scid vs. 960/variants (Chess960 support) [https://github.com/brittonf/scid-vs-variants](https://github.com/brittonf/scid-vs-variants)
*   Debian/Mint/Ubuntu installation how-to [http://www.linuxx.eu/2012/11/scid-vs-pc-installation-guide-ubuntu.html](http://www.linuxx.eu/2012/11/scid-vs-pc-installation-guide-ubuntu.html)
*   Ed Collins' Scid vs. PC page [http://edcollins.com/chess/scidvspc/index.html](http://edcollins.com/chess/scidvspc/index.html)
*   Gorgonian's custom pieces [http://gorgonian.weebly.com/scid-vs-pc.html](http://gorgonian.weebly.com/scid-vs-pc.html)
*   The PGN and EPD standards [http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm](http://www.saremba.de/chessgml/standards/pgn/pgn-complete.htm)
*   Pgn of players [http://www.pgnmentor.com/files.html#players](http://www.pgnmentor.com/files.html#players)
*   Pgn of events [http://www.pgnmentor.com/files.html#events](http://www.pgnmentor.com/files.html#events)
*   Inno setup [http://www.jrsoftware.org/isinfo.php](http://www.jrsoftware.org/isinfo.php) (used to make windows installer)
*   Professional quality chess icons [www.virtualpieces.net](www.virtualpieces.net)
*   Tango icons [http://tango.freedesktop.org/Tango\_Desktop\_Project](http://tango.freedesktop.org/Tango_Desktop_Project)  
      
    
*   Mailing list subscribe (must be a member to post to list) [https://lists.sourceforge.net/lists/listinfo/scidvspc-users](https://lists.sourceforge.net/lists/listinfo/scidvspc-users)
*   Mailing list archive [http://sourceforge.net/mailarchive/forum.php?forum\_name=scidvspc-users](http://sourceforge.net/mailarchive/forum.php?forum_name=scidvspc-users)
*   Programmer's reference [http://scidvspc.sourceforge.net/doc/progref.html](http://scidvspc.sourceforge.net/doc/progref.html)
*   UCI engine protocol [http://wbec-ridderkerk.nl/html/UCIProtocol.html](http://wbec-ridderkerk.nl/html/UCIProtocol.html)
*   Xboard engine protocol [http://www.open-aurec.com/wbforum/WinBoard/engine-intf.html](http://www.open-aurec.com/wbforum/WinBoard/engine-intf.html)

[![Get Scid Vs PC at SourceForge.net. Fast, secure and Free Open Source software downloads](http://sflogo.sourceforge.net/sflogo.php?group_id=263836&type=12)](http://sourceforge.net/projects/scidvspc)
