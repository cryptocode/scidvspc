### Computer Tournament 
###
### comp.tcl: part of Scid.
### Copyright (C) 2010- Steven Atkinson

# Credit to Fulvio for a few lines of UCI code that enabled me
# to make this run nicely (without constantly reseting analysis).
# Also thanks to Uwe for the Carousel scheduling feature.

set comp(playing) 0
set comp(current) 0
set comp(games) {}
set comp(count) 2 ; # number of computer players
set comp(delta) 2000; # 2 seconds is the time
set comp(permoveleeway) 1.75 ;# 175% is the max allowed

### Non-transient options are set in start.tcl

proc compInit {} {
  global analysis comp engines

  set w .comp

  if {[winfo exists $w]} {
    raiseWin $w
    return
  }
  toplevel $w
  wm state $w withdrawn
  wm title $w "Configure Tournament"
  setWinLocation $w

  pack [frame $w.engines -borderwidth 2 -relief ridge] -side left -expand yes -fill both
  addHorizontalRule $w
  pack [frame $w.config] -fill x -expand 1
  addHorizontalRule $w
  pack [frame $w.buttons] -side bottom -pady 5 -padx 5

  ### Engines

  grid [frame $w.engines.top] -row 0 -column 0 -pady 5 -sticky n
  grid [label $w.engines.top.label -text "Number of Engines"] -row 0 -column 0
  grid [spinbox $w.engines.top.count -textvariable comp(count) -from 2 -to [llength $engines(list)] -width 4 -highlightthickness 0] -row 0 -column 1  -padx 15
  dialogbutton $w.engines.top.update -text $::tr(Update) -command drawCombos
  grid $w.engines.top.update -row 0 -column 2 

  set comp(countcombos) $comp(count)
  drawCombos

  ### Config widgets

  set row 0

  label $w.config.eventlabel -text {Tournament Name}
  entry $w.config.evententry -width 17 -textvariable comp(name) -borderwidth 1

  # 17 is magic number to pad the widget out to match the width
  # after the three adjudication buttons have been packed

  grid $w.config.eventlabel -row $row -column 0 -sticky w -padx 5 -pady 2
  grid $w.config.evententry -row $row -column 1 -sticky ew -padx 8 -pady 2

  incr row
  label $w.config.roundslabel -text {Number of Rounds}
  spinbox $w.config.roundsvalue -textvariable comp(rounds) -from 1 -to 10 -width 7

  grid $w.config.roundslabel -row $row -column 0 -sticky w -padx 5 -pady 2
  grid $w.config.roundsvalue -row $row -column 1 -sticky e -padx 5 -pady 2

  incr row
  frame $w.config.control
  label $w.config.control.0 -text {Time Control is per}
  radiobutton $w.config.control.1 -variable comp(timecontrol) -value pergame -text Game -command checkTimeControl
  radiobutton $w.config.control.2 -variable comp(timecontrol) -value permove -text Move -command checkTimeControl

  pack $w.config.control.0 $w.config.control.1 $w.config.control.2 -side left -expand 1 -fill x
  grid $w.config.control  -row $row -column 0 -columnspan 2 -sticky ew -pady 2

  incr row
  frame $w.config.timesecs 
  label $w.config.timesecs.label -text {Time per Move}
  set tmp $comp(seconds)
  spinbox $w.config.timesecs.value -textvariable comp(seconds) -from 1 -to 3600 -width 4
  set comp(seconds) $tmp
  label $w.config.timesecs.label2 -text secs

  pack $w.config.timesecs.label -side left
  pack $w.config.timesecs.label2 $w.config.timesecs.value -side right
  grid $w.config.timesecs -row $row -column 0 -columnspan 2 -sticky ew -pady 2 -padx 5

  incr row
  frame $w.config.timegame 
  set temp $comp(base)
  label $w.config.timegame.label -text {Time per game (seconds)}
  spinbox $w.config.timegame.base -textvariable comp(base) -from 0 -to 7200 -incr 5 -width 4
  set comp(base) $temp

  set temp $comp(incr)
  label $w.config.timegame.label2 -text base
  spinbox $w.config.timegame.incr -textvariable comp(incr) -from 0 -to 60 -width 4
  label $w.config.timegame.label3 -text {incr }
  set comp(incr) $temp

  pack $w.config.timegame.label -side left
  pack $w.config.timegame.label3 $w.config.timegame.incr $w.config.timegame.label2 $w.config.timegame.base -side right
  grid $w.config.timegame -row $row -column 0 -columnspan 2 -sticky ew -pady 2 -padx 5

  incr row
  label $w.config.showclocklabel -text {Show Clocks}
  checkbutton $w.config.showclockvalue -variable comp(showclock) 

  grid $w.config.showclocklabel -row $row -column 0 -sticky w -padx 5 
  grid $w.config.showclockvalue -row $row -column 1 -padx 5 

  checkTimeControl

  incr row
  label $w.config.ponderlabel -text {Permanent Thinking}
  checkbutton $w.config.pondervalue -variable comp(ponder) 

  grid $w.config.ponderlabel -row $row -column 0 -sticky w -padx 5 
  grid $w.config.pondervalue -row $row -column 1 -padx 5 

  incr row
  label $w.config.animatelabel -text {Animate Moves}
  checkbutton $w.config.animatevalue -variable comp(animate) 

  grid $w.config.animatelabel -row $row -column 0 -sticky w -padx 5 
  grid $w.config.animatevalue -row $row -column 1 -padx 5 

  incr row
  label $w.config.scorelabel -text {Engine Scores as Comments}
  ttk::combobox $w.config.scorevalue -width 12 -textvariable comp(scoreType) \
    -state readonly -values {No {+1.5} {[% +1.5]} {[%eval +1.5]}}

  grid $w.config.scorelabel -row $row -column 0 -sticky w -padx 5
  grid $w.config.scorevalue -row $row -column 1 -sticky e -padx 8

  ### Opening Book

  incr row
  frame $w.config.book
  label $w.config.book.label -textvar ::tr(UseBook) 
  checkbutton $w.config.book.value -variable comp(usebook)
  set bookPath $::scidBooksDir
  set bookList [ lsort -dictionary [ glob -nocomplain -directory $bookPath *.bin ] ]
  set tmp {}
  ttk::combobox $w.config.book.combo -width 12 -state readonly
  if { [llength $bookList] == 0 } {
    $w.config.book.value configure -state disabled
    set comp(usebook) 0
  } else {
    set i 0
    set idx 0
    foreach file  $bookList {
      lappend tmp [file tail $file]
      if { $comp(book) == [file tail $file]} {
	set idx $i
      }
      incr i
    }
    $w.config.book.combo configure -values $tmp
    $w.config.book.combo current $idx
  }
  grid $w.config.book -row $row -column 0 -columnspan 2 -sticky ew
  pack $w.config.book.label -side left -padx 5
  pack $w.config.book.combo $w.config.book.value -side right -padx 8

  ### Scheduling / type

  incr row
  label $w.config.scheduling -text {Game Scheduling}
  ttk::combobox $w.config.type -width 19 -textvariable comp(type) \
    -state readonly -values {Normal Carousel {First plays others}}

  grid $w.config.scheduling -row $row -column 0 -sticky w -padx 5
  grid $w.config.type       -row $row -column 1 -sticky e -padx 8

  ### Start Position

  incr row
  label $w.config.startlabel -textvar ::tr(StartPos)
  ttk::combobox $w.config.start -width 19 -textvariable comp(start) \
    -state readonly -values {Normal {First game from current} {All games from current}}

  grid $w.config.startlabel -row $row -column 0 -sticky w -padx 5
  grid $w.config.start -row $row -column 1 -sticky e -padx 8

  ### OK, Cancel Buttons

  if {$::windowsOS} {
    # fixed width dialogbutton cuts text in winxp
    set button button
  } else {
    set button dialogbutton
  }

  $button $w.buttons.cancel -text $::tr(Cancel) -command compClose
  $button $w.buttons.ok -text Ok -command compOk
  $button $w.buttons.help -text $::tr(Help) -command {helpWindow Tourney}

  focus $w.buttons.ok
  pack $w.buttons.ok $w.buttons.help -side left -padx 5
  pack $w.buttons.cancel -side right -padx 5

  bind $w <Configure> "recordWinSize $w"
  wm protocol $w WM_DELETE_WINDOW compClose
  bind $w <Escape> compClose
  bind $w <F1> {helpWindow Tourney}
  update
  wm state $w normal
}

proc checkTimeControl {} {
  set w .comp
  if {$::comp(timecontrol) == "permove" } {
    foreach i [winfo children $w.config.timesecs] {
      $i configure -state normal
    }
    foreach i "[winfo children $w.config.timegame] $w.config.showclocklabel $w.config.showclockvalue" {
      $i configure -state disabled
    }
  } else {
    foreach i [winfo children $w.config.timesecs] {
      $i configure -state disabled
    }
    foreach i "[winfo children $w.config.timegame] $w.config.showclocklabel $w.config.showclockvalue" {
      $i configure -state normal
    }
  }
  update
}

proc compOk {} {
  global analysis comp engines

  set w .comp

  set comp(startfen) [sc_pos fen]

  # make sure decimals have a leading 0
  catch {
    set comp(incr) [expr $comp(incr)]
    set comp(base) [expr $comp(base)]
    set comp(seconds) [expr $comp(seconds)]
  }

  if {$comp(count) != $comp(countcombos)} {
    drawCombos
    return
  }

  if {[sc_base isReadOnly]} {
    set answer [tk_messageBox -title Tournanment -icon question -type okcancel \
	-message {Database is read only. Continue ?} -parent $w]
    if {$answer != "ok"} {return}
  }
  if {![sc_pos isAt end] && $comp(start) != "Normal"} {
    set answer [tk_messageBox -title Tournanment -icon question -type okcancel \
	-message {Current game is not at end of game. Continue ?} -parent $w]
    if {$answer != "ok"} {return}
  }
    
  set players {}
  set comp(players) {} ;# to remember which engines are selected between widget restarts
  set names {}
  set comp(games) {}
  set comp(current) 0
  set comp(book) [.comp.config.book.combo get]

  if {$comp(timecontrol) == "permove"} {
    set comp(time) [expr {int($comp(seconds) * 1000)}]
    puts "Move delay is $comp(time) milliseconds"
  } 

  for {set i 0} {$i < $comp(count)} {incr i} {
    set j [$w.engines.$i.combo current]
    lappend players $j
    lappend names [lindex [lindex $engines(list) $j] 0]
    set comp(score$j) 0
  }
  set comp(players) $players

  if {$comp(type) == "First plays others"} {
    set comp(firstN) [lindex $players 0]
  }

  ### Check players are unique
  if {[llength [lsort -unique $players]] != $comp(count)} {
    tk_messageBox -type ok -parent $w -title {Scid: error} \
      -message {Duplicate engines not supported}
    return
  }
  foreach i $players j $names {
    puts "player $i is $j"
  }

  ### Reconfigure init widget for pausing

  for {set i 0} {$i < $comp(count)} {incr i} {
    $w.engines.$i.combo configure -state disabled ; # disable widgets too
    $w.engines.$i.configure configure -state disabled 
  }
  foreach j {.comp.config .comp.engines .comp.engines.top .comp.config.control .comp.config.timesecs .comp.config.timegame .comp.config.book} {
    foreach i [winfo children $j] {
      catch {$i configure -state disabled}
    }
  }
  $w.buttons.ok configure -text Pause -command compPause -state normal
  pack forget $w.buttons.help
  $w.buttons.cancel configure -text {End Comp} -command compAbort -state normal
  wm title $w "$::scidName Tournament"
  focus $w.buttons.ok

  ### Clocks

  if {$comp(showclock) && $comp(timecontrol) == "pergame"} {
    frame $w.clocks
    pack $w.clocks -side top -expand yes -fill x -padx 20

    ::gameclock::new $w.clocks 1 120 1 horizontal digital
    ::gameclock::new $w.clocks 2 120 1 horizontal digital
    ::gameclock::setColor 1 white
    ::gameclock::setColor 2 black

  }

  ### Extra decision buttons

  frame $w.say
  pack $w.say -side bottom -pady 5 -padx 5

  if {$::windowsOS} {
    # fixed width dialogbutton cuts text in winxp
    set button button
  } else {
    set button dialogbutton
  }

  $button $w.say.white -text "$::tr(White) wins" -command {compGameEnd 1}
  $button $w.say.draw  -text "$::tr(Draw)" -command {compGameEnd =}
  $button $w.say.black -text "$::tr(Black) wins" -command {compGameEnd 0}

  pack $w.say.white $w.say.draw -side left -padx 5
  pack $w.say.black -side right -padx 5
  
  ### Place games in cue

  if {$comp(type) == "Carousel"} {

    ### Uwe's Carousel/Rutschsystem scheduling, (C) Uwe Klimmek 2018

    set gamesPerRound [expr int($comp(count)/2)]
    set even [expr ($comp(count)+1) % 2]
    set rounds [expr $comp(count) -1 ]
    set last [expr $comp(count) -1 ]
    set plist {}
    set hlist {}
    if {!$even} {
      set last [expr $comp(count) - 2]
      set rounds $comp(count)
    }

    for {set k 1} {$k <= $comp(rounds)} {incr k} {
      for {set i 0} {$i < $comp(count)} {incr i} {
	lappend plist $i
      }
      for {set l 1} {$l <= $rounds} {incr l} {
	for {set i 0; set j $last } {$i < $gamesPerRound} {incr i; incr j -1 } {
	  if { $even && [expr ($l-1) % 2] } {
	    lappend comp(games) [list [lindex $comp(players) [lindex $plist $j]] [lindex $comp(players) [lindex $plist $i]] [lindex $names [lindex $plist $j]] [lindex $names [lindex $plist $i]] "$k.$l"]
	    lappend hlist [list [lindex $comp(players) [lindex $plist $i]] [lindex $comp(players) [lindex $plist $j]] [lindex $names [lindex $plist $i]] [lindex $names [lindex $plist $j]] "[expr $k+1].$l"]
	  } else {
	    lappend comp(games) [list [lindex $comp(players) [lindex $plist $i]] [lindex $comp(players) [lindex $plist $j]] [lindex $names [lindex $plist $i]] [lindex $names [lindex $plist $j]] "$k.$l"]
	    lappend hlist [list [lindex $comp(players) [lindex $plist $j]] [lindex $comp(players) [lindex $plist $i]] [lindex $names [lindex $plist $j]] [lindex $names [lindex $plist $i]] "[expr $k+1].$l"]
	  }
	}
	set help [lindex $plist end];
	set xlist [linsert $plist $even $help]
	set plist [lreplace $xlist end end]
      }
      incr k
      if { $k <= $comp(rounds) } {
	append comp(games) " $hlist"
	set hlist {}
      }
    }
  } else {

  for {set i 0} {$i < $comp(count)} {incr i} {
    for {set j 0} {$j <= $i} {incr j} {
      if {$i != $j} {
	for {set k 1} {$k <= $comp(rounds)} {incr k} {
	  compCueGame [lindex $players $j] [lindex $players $i] [lindex $names $j] [lindex $names $i] $k
	  incr k
	  if {$k <= $comp(rounds)} {
	    compCueGame [lindex $players $i] [lindex $players $j] [lindex $names $i] [lindex $names $j] $k
	  }
	}
      }
      if {$comp(type) == "First plays others"} {
        break
      }
    }
  }

  }

  set num_games [llength $comp(games)]
  puts "$num_games GAMES total: $comp(games)"

  ttk::progressbar $w.progress -mode determinate -maximum $num_games -variable comp(current)
  pack $w.progress -side bottom -fill x -padx 10 -pady 5
  if {"$comp(name)" != ""} {
    label $w.statusbar -text "$comp(name): $num_games games"
  } else {
    label $w.statusbar -text "$num_games games"
  }
  pack $w.statusbar -side bottom -fill x -pady 2

  ### Play games

  set thisgame [lindex $comp(games) $comp(current)]

  while {$thisgame != {} } {
    set n     [lindex $thisgame 0]
    set m     [lindex $thisgame 1]
    set name1 [lindex $thisgame 2]
    set name2 [lindex $thisgame 3]
    set k     [lindex $thisgame 4]
    if {$n != {} && $m != {}} {
      puts "Game [expr $comp(current) + 1]: $name1 vs. $name2"
      incr comp(current)
      compNM $n $m $k $name1 $name2
    }
    set thisgame [lindex $comp(games) $comp(current)]
  } 

  ### Comp over

  puts {Comp finished}
  if {[winfo exists .comp]} {
    # voodoo that you do
    wm geometry .comp [wm geometry .comp]
    pack forget .comp.buttons.help

    set winner_score 0
    set winner {}
    set j 0
    foreach i $comp(players) {
      if {$comp(score$i) == $winner_score} {
        append winner ",[lindex [lindex $engines(list) $i] 0]"
        set text Winners
      }
      if {$comp(score$i) > $winner_score} {
        set winner_score $comp(score$i)
        set winner [lindex [lindex $engines(list) $i] 0]
        set text Winner
      }
      incr j
    }
    .comp.statusbar configure -text "$text: $winner ([expr $winner_score/2.0]/[expr ($comp(count)-1)*$comp(rounds)])"

    # Hmm - if we leave this window open , and run F2 (say) the engines can sometimes stop working 
    # So better make sure this window gets closed

    .comp.buttons.ok configure -text [tr Restart] -command {
       compDestroy
       update
       compInit
    }
    .comp.buttons.cancel configure -text [tr Close] -command {
       compDestroy
    }
    foreach i [winfo children $w.say] {
      catch {$i configure -state disabled}
    }
    raiseWin .comp
  }
}

proc compNM {n m k name1 name2} {
  global analysis comp ::uci::uciInfo

  set comp(result) {}
  set comp(resultComment) {}

  if {$comp(timecontrol) == "pergame"} {
    set comp(wtime) [expr int($comp(base)*1000)]
    set comp(btime) [expr int($comp(base)*1000)]
    set total [expr int($comp(base))]
    set mins [expr $total/60]
    set secs [expr $total%60]
    if {$secs == 0} {
      set timecontrol $mins
    } else {
      if {$secs < 10} {
	set secs "0$secs"
      }
      set timecontrol $mins:$secs
    }

    if {$comp(showclock) && $comp(timecontrol) == "pergame"} {
      ::gameclock::setSec 1 [ expr -int($comp(base)) ]
      ::gameclock::setSec 2 [ expr -int($comp(base)) ]
    }
  }

  sc_game new

  if {($comp(start) == {First game from current} && $comp(current) == 1) || $comp(start) == {All games from current}} {
    sc_game startBoard $comp(startfen)
    set comp(startpos) "fen $comp(startfen)"
  } else {
    set comp(startpos) startpos 
  }

  set comp(playing) 1
  set comp(paused) 0
  set comp(white) $n
  set comp(fen) {}
  set incr [expr int($comp(incr) * 1000)]
  set comp(inbook) $comp(usebook)

  if {[winfo exists .analysisWin$n]} "destroy .analysisWin$n"
  if {[winfo exists .analysisWin$m]} "destroy .analysisWin$m"

  ### makeAnalysisWin creates a toplevel widget to run an engine but we don't really need a toplevel %<
  # The problem is that only UCI has a procedure for running an engine without a toplevel (uci::startSilentEngine).
  # There is currently no equivalent for xboard engines

  makeAnalysisWin $n

  if {![winfo exists .analysisWin$n]} {
    set comp(games) {}
    return
  }
  toggleMovesDisplay $n

  makeAnalysisWin $m
  if {![winfo exists .analysisWin$m]} {
    set comp(games) {}
    return
  }
  toggleMovesDisplay $m

  # Stop all engines
  # (Is this necessary ? We are sending a "stop" straight away. &&&)
  if {$analysis(analyzeMode$n)} { toggleEngineAnalysis $n }
  if {$analysis(analyzeMode$m)} { toggleEngineAnalysis $m }
  
  sc_game tags set -white $analysis(name$n)
  sc_game tags set -black $analysis(name$m)
  sc_game tags set -event $comp(name)
  if {$comp(timecontrol) == "permove"} {
    sc_game tags set -date [::utils::date::today] -round $k -extra "{Movetime \"$comp(seconds)\"}"
  } else {
    sc_game tags set -date [::utils::date::today] -round $k -extra "{TimeControl \"$timecontrol/$comp(incr)\"}"
  }
  if {$comp(type) == "First plays others"} {
    # Show games from first players view
    if {( $n == $comp(firstN) &&  [::board::isFlipped .main.board] ) || \
	( $m == $comp(firstN) && ![::board::isFlipped .main.board] ) } {
      ::board::flip .main.board
    }
  }
  update idletasks
  updateBoard -pgn

  updateTitle
  update

  ### Thanks to HGM and Talkchess for help with UCI/Xboard protocols

  ### Initialisation

  foreach current_engine "$n $m" {
    ### don't display engine output
    set analysis(movesDisplay$current_engine) 2
    toggleMovesDisplay $current_engine

    if {$analysis(uci$current_engine)} {
        ### UCI initialisation

        # fulvio issues isready every move ??
	set analysis(waitForReadyOk$current_engine) 1
	sendToEngine $current_engine ucinewgame
        if {$comp(ponder)} {
	  sendToEngine $current_engine "setoption name Ponder value true"
        } else {
	  sendToEngine $current_engine "setoption name Ponder value false"
        } 
	sendToEngine $current_engine "isready"
	vwait analysis(waitForReadyOk$current_engine)
	# if {!$comp(playing)} {break}
	# sendToEngine $current_engine {debug off}
    } else {
        ### xboard initialisation

	sendToEngine $current_engine xboard

        if {!$analysis(seen$current_engine)} {
          vwait analysis(seen$current_engine)
        }

	sendToEngine $current_engine "protover 2"
        if {$comp(ponder)} {
	  sendToEngine $current_engine "hard"
        } else {
	  sendToEngine $current_engine "easy"
        }
	sendToEngine $current_engine "bk off"
	sendToEngine $current_engine "nopost"

	# done later
	# sendToEngine $current_engine "st $comp(seconds)"

	### Hacks

	if {0} {
	  # Sjeng or Chen run too fast unless "hard" is issued
	  if {[regexp -nocase arasan $analysis(name$current_engine)]} {
	    sendToEngine $current_engine hard
	  }
	  if {[regexp -nocase sjeng $analysis(name$current_engine)]} {
	    sendToEngine $current_engine hard
	  }
	  if {[regexp -nocase xchen $analysis(name$current_engine)] || \
	      [regexp -nocase chenard $analysis(name$current_engine)] } {
	    sendToEngine $current_engine hard
	  }
	}

        ### Setup initial position

	if {$comp(startpos) == "startpos"} {
	  if {$current_engine == $m} {
            # "new" command means "play black"
            sendToEngine $current_engine "new"
          }
        } else {
	  # If no setboard... good luck
	  sendToEngine $current_engine "setboard $comp(startfen)"
          # Without force, some engines try to play both side !?
	  sendToEngine $current_engine "force"
        }

        ### Send initial time control

        if {$comp(timecontrol) == "permove"} {
          sendToEngine $current_engine "st $comp(seconds)"
        } else {
          set secs [expr $comp(wtime)/1000]
          set seconds [expr $secs%60]
          if {$seconds < 10} {
            set seconds 0$seconds
          }
          set mins [expr $secs/60]:$seconds
          sendToEngine $current_engine "level 0 $mins $comp(incr)"
          ### set search depth.
          # "sd" is meant to be orthogonal to the "time" command, but the first engine i tested (zct) never came back
          # While spike needs it set to something reasonable, otherwise it never plays a move
          # but spike is uci too... hmmm
          # sendToEngine $current_engine "sd 12"
	}
    }
  }

  if {[sc_pos side] == "white"} {
    set current_engine $n
    set other_engine $m
  } else {
    set current_engine $m
    set other_engine $n
  }
  
  # Automatically set a timeout value &&&
  if {$comp(timecontrol) == "permove"} {
    # Automatically time-out comp in $movetime + 2 secs
    after [expr {$comp(time) + $comp(delta)}] compTimeout
  } else {
    after [expr {$comp(wtime) + $comp(delta)}] compTimeout
  }

  ### Main control loop
  # Thanks to Fulvio for inspiration to rewrite this properly :>

  while {$comp(playing)} {

    # hmm... promo pieces are shown in uppercase, but this crashes some engines
    set movehistory [sc_game moves coord]

    if {$comp(showclock) && $comp(timecontrol) == "pergame"} {
      if {$current_engine == $n} {
	::gameclock::start 1
      } else {
	::gameclock::start 2
      }
    }

    set comp(lasttime) [clock clicks -milli]
    set comp(move) $current_engine
    set comp(nextmove) $other_engine
    set lastmove [lindex $movehistory end]
    set comp(bookmove) {}

    if {$analysis(uci$current_engine)} {
      ### UCI main loop
      if {$comp(inbook) && $comp(book) != ""} {
        catch {
          # KomodoVariety.bin has bugs
	  set comp(bookmove) [::book::getMove $comp(book) $::sergame::bookSlot]
        }
        if {$comp(bookmove) == ""} {
          set comp(inbook) 0
        }
      }

      if {$comp(bookmove) == ""} {

	### position

	set hit 0

	if {$movehistory == {}} {
	  sendToEngine $current_engine "position $comp(startpos)"
	} elseif {!$comp(ponder)} {
	  sendToEngine $current_engine "position $comp(startpos) moves $movehistory"
	} else {
	  if {$uciInfo(ponder$current_engine) == $lastmove && $lastmove != {}} {
	    sendToEngine $current_engine "ponderhit"
	    set hit 1
	  } else {
	    if {[llength $movehistory] > 1 && $uciInfo(ponder$current_engine) != {}} {
	      sendToEngine $current_engine "stop"
	      set uciInfo(bestmove$current_engine) stop
	    }
	    sendToEngine $current_engine "position $comp(startpos) moves $movehistory"
	  }
	}

	### go

	if {$comp(timecontrol) == "permove"} {
	  if {!$hit} {
	    sendToEngine $current_engine "go movetime $comp(time)"
	  }
	} else {
	  if {!$hit} {
	    sendToEngine $current_engine "go wtime $comp(wtime) btime $comp(btime) winc $incr binc $incr"
	  }
	}

	# set analysis(fen$current_engine) [sc_pos fen]
	set analysis(maxmovenumber$current_engine) 0

	set analysis(waitForBestMove$current_engine) 1
	vwait analysis(waitForBestMove$current_engine)
      }

      if {!$comp(playing)} {break}

    } else {
      ### Xboard main loop
      # Setup times

      if {$comp(timecontrol) != "permove"} {
	# Should we only send time, otim if has "time" as a feature &&&
	if {$comp(white) == $current_engine} {
	  sendToEngine $current_engine "time [expr $comp(wtime)/10]"
	  sendToEngine $current_engine "otim [expr $comp(btime)/10]"
	} else {
	  sendToEngine $current_engine "time [expr $comp(btime)/10]"
	  sendToEngine $current_engine "otim [expr $comp(wtime)/10]"
	}
      } else {
	### permove time control doesn't need reissuing ?
	# sendToEngine $current_engine "st $comp(seconds)"
      }

      # Setup move

      set nummoves [llength $comp(fen)]
      if {$nummoves == 0 } {
        sendToEngine $current_engine "go"
      } elseif {$nummoves == 1 && $comp(startpos) != "startpos"} {
	sendToEngine $current_engine "setboard [sc_pos fen]"
	sendToEngine $current_engine "go"
      } else {
	### Send the previous move to engine
	# (protocol 2 can also use "usermove MOVE")
	if {$lastmove != {}} {
	  sendToEngine $current_engine $lastmove
	} ; # else "go" ?
      }

      vwait analysis(waitForBestMove$current_engine)

      if {!$comp(playing)} {break}
    }

    set expired [expr [clock clicks -milli] - $comp(lasttime)]

    if {$analysis(uci$other_engine) && $comp(ponder) && ($uciInfo(ponder$other_engine) != "")} {
      ### UCI other engine

      # position
      if {$movehistory != {}} {
        ### todo - verfiy this works all scenarios (ponder with non-standard start)
	sendToEngine $other_engine "position $comp(startpos) moves $movehistory $uciInfo(ponder$other_engine)"
      }

      # go
      if {$comp(timecontrol) == "permove"} {
	sendToEngine $other_engine "go ponder movetime $comp(time)"
      } else {
	sendToEngine $other_engine "go ponder wtime $comp(wtime) btime $comp(btime) winc $incr binc $incr"
      }

    }

    # Updating the board (via makeAnalysisMove) takes order of
    # 1/40th second (23000microseconds)  on my core2quad

    if {[makeCompMove $current_engine]} {
      ### Store evaluation (and time)

      if {$comp(scoreType) != "No"} {
	set text $analysis(score$current_engine)
	if {$text != 0} {
	  if {$text > 0} {
	    set text +$text
	  }
	  switch $comp(scoreType) {
	    {[% +1.5]}     { set text "\[% $text\]" }
	    {[%eval +1.5]} { set text "\[%eval $text\]" }
	  }
	  sc_pos setComment $text
	}
      }
      # sc_pos setComment "\[%ms $expired\]\[%eval $analysis(score$current_engine)\]"

      ### Move success

      after cancel compTimeout

      if {$comp(showclock) && $comp(timecontrol) == "pergame"} {
	if {$current_engine == $n} {
	  ::gameclock::stop 1
	} else {
	  ::gameclock::stop 2
	}
      } 
      # Note - No time slice enforcement for permove time control

      while {$comp(paused)} {
	vwait comp(paused)
      }

      ### Check if game is over

      if {[sc_pos isInsufficient]} {
	  compResult {=} {Scid: Insufficient Material}
	  break
      }
      if {[sc_pos moves] == {}} {
	if {![sc_pos isCheck]} {
	  ### stalemate
	  compResult {=} [tr stalemate]
	} else {
	  ### checkmate
	  if {[sc_pos side] == {black}} {
	    sc_game tags set -result 1
	  } else {
	    sc_game tags set -result 0
	  }
	}
	break
      } else {
	set fen [sc_pos fen]
	set f [lindex $fen 0]
	lappend comp(fen) $f
	if {[llength [lsearch -all $comp(fen) $f]] > 2 || [lindex $fen 4] > 99} {
          if {[lindex $fen 4] > 99} {
	    compResult {=} "50 move rule"
          } else {
	    # Could we use "sc_pos analyse" for 3 fold detection ?
	    compResult {=} "3 fold repetition"
          }
	  break
	} 
      }

      ### Swap players

      if {$current_engine != $n} {
	if {$comp(timecontrol) == "pergame"} {
	  set comp(btime) [expr $comp(btime) - $expired]
          if {$comp(btime) < 0} {
	    compResult 1 {Black loses on time}
            break
          }
          # add time increment
          if {$comp(bookmove) == ""} {
	    incr comp(btime) $incr
          }
	  if {$comp(showclock) && $comp(timecontrol) == "pergame"} {
	    ::gameclock::setSec 2 [ expr -int($comp(btime)/1000) ]
	  }
          # In case white hangs, automatically time-out comp in $wtime + 2 secs
          after [expr {$comp(wtime) + $comp(delta)}] compTimeout
        } else {
          if {$expired > $comp(permoveleeway)*$comp(time)} {
	    compResult 1 "Blacks move takes $expired secs"
            break
          }
          # Automatically time-out comp in $movetime + 2 secs
	  after [expr {$comp(time) + $comp(delta)}] compTimeout
        }
        # Now its whites turn
	set current_engine $n
	set other_engine $m
      } else {
	if {$comp(timecontrol) == "pergame"} {
	  set comp(wtime) [expr $comp(wtime) - $expired]
          if {$comp(wtime) < 0} {
	    compResult 0 {White loses on time}
            break
          }
          # add time increment
          if {$comp(bookmove) == ""} {
	    incr comp(wtime) $incr
          }
	  if {$comp(showclock) && $comp(timecontrol) == "pergame"} {
	    ::gameclock::setSec 1 [ expr -int($comp(wtime)/1000) ]
	  }
          # In case black hangs, automatically time-out comp in $wtime + 2 secs
	  after [expr {$comp(btime) + $comp(delta)}] compTimeout
        } else {
          if {$expired > $comp(permoveleeway)*$comp(time)} {
	    compResult 0 "Whites move takes $expired secs"
            break
          }
          # Automatically time-out comp in $movetime + 2 secs
	  after [expr {$comp(time) + $comp(delta)}] compTimeout
        }
        # Now its blacks turn
	set current_engine $m
	set other_engine $n
      }

    } else {
      ### Move failed... don't swap players

      ### Unlikely, but could happen
      while {$comp(paused)} {
	after cancel compTimeout

	vwait comp(paused)

	# todo - handle wtime/btime
	if {$comp(timecontrol) == "pergame"} {
	  after [expr {$comp(time) + $comp(delta)}] compTimeout
        }
      }
    }

  } ; # end main control loop

  ### This game is over

  after cancel compTimeout

  if {$comp(showclock) && $comp(timecontrol) == "pergame"} {
    ::gameclock::stop 1
    ::gameclock::stop 2
  }

  ### Save game

  # In case game has been adjudicated by user, set result here
  if {$comp(result) != {}} {
    sc_game tags set -result $comp(result)
  }

  set result [sc_game tags get Result]
  puts "Game $n - $m is over. Result $result"
  switch $result {
    1 { set tmp 1-0 ; incr comp(score$n) 2 }
    0 { set tmp 0-1 ; incr comp(score$m) 2 }
    = { set tmp Draw ; incr comp(score$n) ; incr comp(score$m) }
    default { set tmp {} }
  }

  if {$::comp(resultComment) == ""} {
    .comp.statusbar configure -text "$name1 v $name2 result: $tmp"
  } else {
    if {"$tmp" == ""} {
      .comp.statusbar configure -text "$name1 v $name2 : $::comp(resultComment)"
    } else {
      .comp.statusbar configure -text "$name1 v $name2 : $::comp(resultComment), $tmp"
    }
  }

  if {$comp(timecontrol) == "pergame"} {
    set comment [sc_pos getComment]
    if {$comment == {}} {
      sc_pos setComment "wtime $comp(wtime), btime $comp(btime)"
    } else {
      sc_pos setComment "$comment.\nwtime $comp(wtime), btime $comp(btime)"
    }
  }

  if {![sc_base isReadOnly]} {
    sc_game save [sc_game number]
    ::windows::gamelist::Refresh
    ::crosstab::Refresh
  }
  # ::pgn::Refresh 1
  updateBoard -pgn

  catch {destroy .analysisWin$n}
  catch {destroy .analysisWin$m}
  set comp(playing) 0
}

proc compResult {result comment} {
  # Is set result necessary here ?
  sc_game tags set -result $result
  sc_pos setComment $comment
  set ::comp(resultComment) $comment
}

proc makeCompMove {current_engine} {
  if {$::comp(bookmove) != {}} {
    sc_move addSan $::comp(bookmove)

    if {$::comp(animate)} {
      updateBoard -pgn -animate
    } else {
      updateBoard -pgn 
    }
    return 1
  } else {
    return [makeAnalysisMove $current_engine]
  }
}

proc compPause {} {
  global analysis comp engines
  set w .comp

  after cancel compTimeout
  $w.buttons.ok configure -text Resume -command compResume
  set comp(paused) 1
}

proc compResume {} {
  global analysis comp engines
  set w .comp

  $w.buttons.ok configure -text Pause -command compPause
  set comp(paused) 0
}

proc drawCombos {} {
  global analysis comp engines

  # Check number of engines is sane
  if {![string is integer -strict $comp(count)] || $comp(count) < 2} {
    set comp(count) 2
    update
  }
  if {$comp(count) > [llength $engines(list)]} {
    set comp(count) [llength $engines(list)]
    update
  }

  set w .comp
  set l $w.engines

  # grid [frame $l] -col 0 -row $row -padx 5 -pady 2

  set values {}

  foreach e $engines(list) {
    lappend values [lindex $e 0]
  }

  for {set i 0} {$i < $comp(count)} {incr i} {

    if {[winfo exists $l.$i]} {
      continue
    }

    frame $l.$i
    grid $l.$i -row [expr $i + 1] -column 0 -columnspan 3

    ttk::combobox  $l.$i.combo -width 20 -state readonly -values $values

    button $l.$i.configure -image uci -command "
      ::uci::uciConfigN \[ $l.$i.combo current \] .comp
    "
    button $l.$i.log -image tb_annotate -command "
      engineShowLog  \[ $l.$i.combo current \]
    "

    pack $l.$i.log $l.$i.configure $l.$i.combo -side left -padx 7

    if {[info exists comp(players)]} {
      # Set the combo boxes to the previous players if we can
      set prev_player [lindex $comp(players) $i]
      if {[catch {$l.$i.combo current $prev_player}]} {
	$l.$i.combo current $i
      }
    } else {
      $l.$i.combo current $i
    }

  }

  # destroy extra combos
  while {[winfo exists $l.$i]} {
    destroy $l.$i
    incr i
  }

  set comp(countcombos) $comp(count)
  update
}

proc compCueGame {n m name1 name2 k} {
  global analysis comp
  lappend comp(games) [list $n $m $name1 $name2 $k]
}


proc compTimeout {} {
    global analysis comp

    puts "Timed out"

    set expired [expr [clock clicks -milli] - $comp(lasttime)]
    if {[sc_pos side] == "white"} {
      if {$comp(timecontrol) == "pergame"} {
	set comp(wtime) [expr $comp(wtime) - $expired]
        set comment {Timed out}
      } else {
        set comment "White movetime [expr $expired / 1000.0] secs"
      }
      set result 0
    } else {
      if {$comp(timecontrol) == "pergame"} {
	set comp(btime) [expr $comp(btime) - $expired]
        set comment {Timed out}
      } else {
        set comment "Black movetime [expr $expired / 1000.0] secs"
      }
      set result 1
    }

    compGameEnd $result $comment
}

proc compGameEnd {result {comment {Manual adjudication}}} {
    global analysis comp
 
    if {$comp(paused)} {
      compResume
    }
    set comp(playing) 0
    set comp(result) $result
    sc_pos setComment $comment
    set comp(resultComment) $comment

    set analysis(waitForReadyOk$comp(move)) 1
    set analysis(waitForBestMove$comp(move)) 1
}

proc compAbort {} {
    # Close all games, called when game is active
    global analysis comp

    if {$comp(paused)} {
      compResume
    }
    set comp(playing) 0
    set comp(games) {}
    set comp(resultComment) {Comp Aborted}

    catch {
      set analysis(waitForReadyOk$comp(move)) 1
      set analysis(waitForBestMove$comp(move)) 1
    }
}

proc compClose {} {
    global analysis comp
    if {[.comp.buttons.cancel cget -text] == {End Comp}} {
      # comp is running. Double check before exitting
      set msg {A Computer Tournament is running.}

      set answer [tk_dialog .unsaved "Scid: Confirm Quit" $msg question {} "   [tr FileExit]   " [tr Cancel]]
      if {$answer != 0} {
	return
      }
    }
    compDestroy
}

proc compDestroy {} {
    global comp

    ### there's some ttk bug when destroying widget, but havent found it yet
    # ttk::combobox seems to need destroying
    # for {set i 0} {$i < $comp(countcombos)} {incr i} {
    # must unbind .comp Destroy
    # destroy  .comp.engines.$i
    # }

    set comp(games) {}
    set comp(playing) 0
    update idletasks
    destroy .comp
}

###
### End of file: comp.tcl
###
