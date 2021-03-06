
####################
# ECO Browser window

set ::windows::eco::code ""
set ::windows::eco::count 0

proc ::windows::eco::Open {} {
  set w .ecograph

  if {[winfo exists $w]} {
    raiseWin $w
  } else {
    ::windows::eco::Refresh
  }
}

#    Updates the ECO Browser window, opening it if necessary.
#    If the ECO code "code" is "x", then the value of the
#    variable ::windows::eco::code is used instead.

proc ::windows::eco::Refresh {{code "x"}} {
  set w .ecograph

  set graph $w.pane.graph
  set text $w.pane.text
  if {$code != "x"} { set ::windows::eco::code $code }
  if {! [winfo exists $w]} {
    toplevel $w
    wm minsize $w 200 100
    setWinLocation $w
    setWinSize $w
    bind $w <Escape> "destroy $w"
    bind $w <F1> {helpWindow ECO Browser}
    bind $w <Destroy> {}
    text $w.title -relief flat -height 1 -width 1 -wrap word -font font_Bold
    $w.title tag configure center -justify center
    $w.title configure -cursor top_left_arrow
    pack $w.title -side top -fill x
    frame $w.b
    pack $w.b -side bottom -fill x

    entry $w.b.find 
    bind $w.b.find <Return> {
      set w .ecograph
      set text $w.pane.text

      set find [string trim [$w.b.find get]]
      if {$find != {}} {
	$text.text configure -state normal
	$text.text delete 1.0 end
	::htext::display $text.text [sc_eco find $find 1]
      }
    }

    button $w.b.up -image bookmark_up -command { ::windows::eco::Up }
    dialogbutton $w.b.refresh -textvar ::tr(Update) -command "::windows::eco::Refresh"
    dialogbutton $w.b.help -textvar ::tr(Help) -command {helpWindow ECO Browser}
    dialogbutton $w.b.close -textvar ::tr(Close) -command "destroy $w"
    pack $w.b.find -side left -padx 5 -pady 5 -fill x -expand yes
    packbuttons right $w.b.close $w.b.help $w.b.refresh $w.b.up
    set pane [::utils::pane::Create $w.pane graph text 500 400 0.5]
    ::utils::pane::SetRange $w.pane 0.3 0.7
    ::utils::pane::SetDrag $w.pane 0
    pack $pane -side top -expand true -fill both

    canvas $graph.c -width 500 -height 250
    pack $graph.c -side top -fill both -expand yes
    text $text.text -height 12 -width 75 -wrap word -font font_Regular \
      -yscroll "$text.ybar set" -xscroll "$text.xbar set"
    $text.text tag configure bold -font font_Bold
    $text.text tag configure indent -lmargin2 20
    $text.text configure -cursor top_left_arrow
    ::htext::init $text.text
    scrollbar $text.ybar -command "$text.text yview"
    scrollbar $text.xbar -orient horizontal -command "$text.text xview"
    grid $text.text -row 0 -column 0 -sticky nesw
    grid $text.ybar -row 0 -column 1 -sticky nesw
    #grid $text.xbar -row 1 -column 0 -sticky nesw
    grid rowconfig $text 0 -weight 1 -minsize 0
    grid columnconfig $text 0 -weight 1 -minsize 0

    standardShortcuts $w

    bind $w <Home>  {.ecograph.pane.text.text yview moveto 0}
    bind $w <End>   {.ecograph.pane.text.text yview moveto 1.0}
    bind $w <Up>    {.ecograph.pane.text.text yview scroll -1 units}
    bind $w <Down>  {.ecograph.pane.text.text yview scroll 1 units}
    bind $w <Prior> {.ecograph.pane.text.text yview scroll -1 pages}
    bind $w <Next>  {.ecograph.pane.text.text yview scroll 1 pages}
    bindMouseWheel $w $w.pane.text.text

    bind $graph.c <1> { ::windows::eco::Select %x }
    # bind $graph.c <3> { ::windows::eco::Up }

    bind $graph <Configure> {
      ::utils::graph::configure eco -height [expr {[winfo height .ecograph.pane.graph.c] - 50} ]
      ::utils::graph::configure eco -width [expr {[winfo width .ecograph.pane.graph.c] - 60} ]
      ::utils::graph::redraw eco
    }
    bind $w <Configure> {
      ::utils::graph::configure eco -height [expr {[winfo height .ecograph.pane.graph.c] - 50} ]
      ::utils::graph::configure eco -width [expr {[winfo width .ecograph.pane.graph.c] - 60} ]
      ::utils::graph::redraw eco
      recordWinSize .ecograph
    }
    wm title $w "[tr WindowsECO]"
    ::utils::graph::create eco -width 1 -height 1 -xtop 50 -ytop 20 \
      -xmin 0.5 -xtick 1 -ytick 5 -font font_Small -canvas $graph.c
    catch {
      .configSerGameWin.fopening.frame.importEco configure -state normal
    }
  } else {
    raiseWin $w
  }

  set height [expr {[winfo height $graph.c] - 50} ]
  set width [expr {[winfo width $graph.c] - 60} ]

  set code $::windows::eco::code
  set ::windows::eco::usedcode $code
  # Collect data:
  set len [string length $code]
  set subcodes {}
  if {$len == 0} {
    set subcodes {A B C D E}
  } elseif {$len == 1  ||  $len == 2} {
    set subcodes {0 1 2 3 4 5 6 7 8 9}
  } elseif {$len == 3} {
    set subcodes {a b c d e f g h i j k l m n o p q r s t u v w x y z}
  }

  set xlabels {}
  set count 0
  set data {}
  set maxfreq 1
  set wins {}
  set draws {}

  foreach i $subcodes {
    set subcode "$code$i"
    set stats [sc_base ecoStats $subcode]
    set freq [lindex $stats 0]
    incr count
    lappend data $count
    lappend data $freq
    lappend wins $count
    lappend wins [lindex $stats 1]
    lappend draws $count
    lappend draws [expr {[lindex $stats 1] + [lindex $stats 2] + [lindex $stats 4]} ]
    if {$freq > $maxfreq} {set maxfreq $freq}
    if {$len == 3} {
      set subcode $i
    }
    lappend xlabels [list $count $subcode]
  }
  set hline 5
  if {$maxfreq >    20} { set hline    10 }
  if {$maxfreq >    50} { set hline    25 }
  if {$maxfreq >   100} { set hline    50 }
  if {$maxfreq >   200} { set hline   100 }
  if {$maxfreq >   500} { set hline   250 }
  if {$maxfreq >  1000} { set hline   500 }
  if {$maxfreq >  2000} { set hline  1000 }
  if {$maxfreq >  5000} { set hline  2500 }
  if {$maxfreq > 10000} { set hline  5000 }
  if {$maxfreq > 20000} { set hline 10000 }
  if {$maxfreq > 50000} { set hline 25000 }
  if {$maxfreq > 100000} { set hline 50000 }

  ::utils::graph::create eco -width $width -height $height -xtop 50 -ytop 20 \
    -xmin 0.5 -xtick 1 -ytick $hline -font font_Small -canvas $graph.c
  # Tree colours are grey10 grey75 white
  # Used to be SteelBlue4 , SteelBlue3 , SteelBlue1
  ::utils::graph::data eco data -color grey15 -points 0 -lines 0 -bars 1 \
    -barwidth 0.8 -outline black -coords $data
  ::utils::graph::data eco draws -color grey75 -points 0 -lines 0 -bars 1 \
    -barwidth 0.8 -outline black -coords $draws
  ::utils::graph::data eco wins -color white -points 0 -lines 0 -bars 1 \
    -barwidth 0.8 -outline black -coords $wins
  ::utils::graph::data eco bounds -points 0 -lines 0 -bars 0 -coords {1 0 1 1}
  ::utils::graph::configure eco -ymin 0 -xmin 0.4 -xmax [expr {$count + 0.6} ] \
    -xlabels $xlabels -hline [list [list gray80 1 each $hline]] -highx DodgerBlue
  ::utils::graph::redraw eco
  $text.text configure -state normal
  $text.text delete 1.0 end
  set stats [sc_base eco $code]
  if {$len == 0} {
    set section $::tr(ECOAllSections)
  } elseif {$len < 3} {
    set section "$::tr(ECOSection) <b>$code</b>"
  } else {
    set section "$::tr(ECOCode) <b>$code</b>"
  }

  set header "<center>$section<br>"
  append header "<b>[lindex $stats 0] $::tr(games)</b>: +[lindex $stats 1] =[lindex $stats 2] -[lindex $stats 3]  (<b>[lindex $stats 5]%</b>)</center>\n\n"
  ::htext::display $text.text "$header[sc_eco summary $code 1]"
  $w.title configure -state normal
  $w.title delete 1.0 end

  set fname [sc_base filename]
  set fname [file tail $fname]
  # if {$fname == ""} { set fname "<none>" }

  $w.title insert end "$::tr(Database) $fname ([lindex [sc_base eco {}] 0] / [sc_base numGames [sc_base current]] games classified)" center
  $w.title configure -state disabled
  set ::windows::eco::count $count
}

proc ::windows::eco::Select {xc} {
  variable count
  variable code

  set x [::utils::graph::xunmap eco $xc]
  set selection 0
  for {set i 1} {$i <= $count} {incr i} {
    if {$x >= [expr {$i - 0.4} ]  &&  $x <= [expr {$i + 0.4} ]} {
      set selection $i
    }
  }
  if {$selection == 0} { return }
  incr selection -1
  set len [string length $code]
  if {$len == 0} {
    set code [lindex {A B C D E} $selection]
  } elseif {$len == 1  ||  $len == 2} {
    append code $selection
  } elseif {$len == 3} {
    append code [lindex {a b c d e f g h i j k l m n o p q r s t u v w x y z} $selection]
  } else {
    return
  }
  ::windows::eco::Refresh
}

#    Handle keyboard events in ECO browser window
#  Mostly unused now - S.A.

proc ::windows::eco::Up {} {
  set code $::windows::eco::code
  set len [string length $code]
  set ::windows::eco::code [string range $code 0 [expr {$len - 2} ]]
  ::windows::eco::Refresh
}

proc ::windows::eco::LoadFile {} {
  global ecoFile

  set ftype { { "Scid ECO files" {".eco"} } }
  if {[sc_info gzip]} {
    set ftype { { "Scid ECO files" {".eco" ".eco.gz"} } }
  }
  set fullname [tk_getOpenFile -initialdir [pwd] -filetypes $ftype -title "Load ECO file"]
  if {[string compare $fullname ""]} {
    if {[catch {sc_eco read $fullname} result]} {
      tk_messageBox -title Scid -type ok \
          -icon warning -message $result
    } else {
      set ecoFile $fullname
      tk_messageBox -title "Scid: ECO file loaded." -type ok -icon info \
          -message "ECO file $fullname loaded: $result positions.\n\nTo have this file automatically loaded when you start Scid, select \"Save Options\" from the Options menu before exiting."
    }
  }
}

proc ::windows::eco::importMoveList {line {eco {}}} {
  # if game num is 0, discard it, as it is probably just another eco line.
  if {[sc_game number] != 0} {
    set confirm [::game::ConfirmDiscard]
    if {$confirm == 2} { return }
    if {$confirm == 0} {
      ::game::Save
    }
  }
  setTrialMode 0
  sc_game new
  ::windows::gamelist::Refresh
  ::importMoveList $line
  if {$eco != ""} {
    set ::windows::eco::code [string trim $eco]
  }
}

