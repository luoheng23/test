//module mexparser

import os
import term

enum  RuleContent { // use in rules
 CONNECVAL
 ATTRIBUTE
 CONFVAL
 VALPLACE
 FUNCPROC
 TYPPLACE
 ORPLACE
 CALCCF
 RULENUM
}

enum  Connect { // use in rules
 AND
 OR
 NOT
 ANDNOT
 ORNOT
}

struct Rulecont { // use in rules
mut:
 connecval Connect
 attribute string
 confval   f64
 valplace  string
 funcproc  []string
 typplace  types
 orplace   Rulecont
 calccf    f64
 rulenum   string
}

enum  rulesection {
 ANCEDENT
 PRECIDENT
}


struct Rule {
mut:
	rule1 []Rulecont
	rule2 []Rulecont
}

pub fn (r mut Rule) rule_append(which rulesection, c Rulecont) {
	if which == rulesection.ANCEDENT {
	  r.rule1 << c
	}	else {
		r.rule2 << c
	}
}

pub fn (r mut Rule) rule_prepend(which rulesection, c Rulecont) {
	if which == rulesection.ANCEDENT {
	  r.rule1.prepend(c)
	}	else {
		r.rule2.prepend(c)
	}
}


pub fn (r mut Rule) rule_insert_at(which rulesection, c Rulecont, at int) {
	if which == rulesection.ANCEDENT {
	  r.rule1.insert(at, c)
	}	else {
	  r.rule2.insert(at, c)
	}
}

pub fn (r mut Rule) rule_delete_at(which rulesection, at int) {
	if which == rulesection.ANCEDENT {
	  r.rule1.delete(at)
	}	else {
	  r.rule2.delete(at)
	}
}

pub fn (r Rule) get_rule_size(which rulesection) int {
	if which == rulesection.ANCEDENT {
	  return r.rule1.len
	}	else {
		return r.rule2.len
	}
}

pub fn (r Rule) get_rule_at(which rulesection, at int) Rulecont {
	if which == rulesection.ANCEDENT {
	  return r.rule1[at]
	}	else {
		return r.rule2[at]
	}
}

pub fn (r Rule) get_rule(which rulesection) []Rulecont {
	if which == rulesection.ANCEDENT {
	  return r.rule1
	}	else {
		return r.rule2
	}
}


struct Prompt {
mut:
  prompt  string
	num    bool
	cf     f64
}


struct Attribute {
mut:
  attr        string
  prompt      string
  translation string
  numeric     bool
	cf          f32
}

pub fn new_attr() &Attribute {
	attribute := &Attribute {
		translation: ""
		prompt     : ""
		attr       : ""
		numeric    : false
		cf         : 0.0
	}
	return attribute
}

pub fn new_attribute(attribute,translation,prompt string, isnumeric bool) &Attribute {
	attr := &Attribute {
		translation: translation
		prompt     : prompt
		attr       : attribute
		numeric    : isnumeric
		cf         : 0.0
	}
	return attr
}



struct Memory {
mut:
	attribute  map[string]Attribute
	rule  []Rule
}


pub fn new_memory() &Memory {
	memory := &Memory {
		attribute : map[string]Attribute
	  rule : []Rule
	}
	return memory
}


struct Scanner {
mut:
	lines   []string
	mem     Memory
	line    string
	curline int
	linepos int
}

enum Keywords {
	PROMPT TRANS RULE COMMENT DEFAULTCF NONE
}

enum types {
	STRING CF NONE
}

pub fn new_scanner(file_path string) &Scanner {
	if !os.file_exists(file_path) {
	  return &Scanner{}
	}
	raw_text := os.read_lines(file_path.trim_space())
	scanner := &Scanner {
		lines: raw_text
		line: raw_text[0]
		curline: 0
		linepos: 0
		mem: Memory{}
	}
	return scanner
}


pub fn (s mut Scanner) mexparse() bool {
  mut typ := Keywords.NONE
  mut l := ''
  term.erase_clear()
  arraylen := s.lines.len

  s.curline = 0
  for s.curline < arraylen {
	  l = s.lines[s.curline]
	  s.line = l.trim_space()
	  s.linepos=1
	  if s.line.left(2) == '--' {
			typ = Keywords.COMMENT
		  s.curline++
	  }
	  else if s.line.left(2) == 'IF' {
			typ = Keywords.RULE
			//println(s.line.trim_space())
		  s.curline++
	  }
	  else if s.line.left(5) == 'TRANS' {
			mut runline := '' mut l1 := ''
			key := s.line.substr(5, s.line.len).trim_space()
			if key in s.mem.attribute {
			  l1 = s.mem.attribute[key].translation  + '\n'
			  println(term.bold(term.red('---------got it---------')))
			}
			s.curline++
			for {
				runline = s.lines[s.curline].trim_space()
				if runline == '.' {
					break
				}
				l1 = l1 + runline + '\n'
				s.curline++
			}
			s.mem.attribute[key].translation = l1

		  println(term.bold(term.red('------------------')))
			println(l1)
			println(key)
			println(s.mem.attribute[key].translation)
		  println(term.bold(term.red('------------------')))
		  s.curline++
	  }
	  else if s.line.left(14) == 'NUMERIC PROMPT' {
			mut runline := ''
			mut l1 := ''
			key := s.line.substr(15, s.line.len).trim_space()
			if key in s.mem.attribute {
			  l1 = s.mem.attribute[key].prompt  + '\n'				
				s.mem.attribute[key].numeric = true				
			  println(term.bold(term.green('--------got it----------')))
			}
			s.curline++
			for {
				runline = s.lines[s.curline].trim_space()
				if runline == '.' {
					break
				}
				l1 = l1 + runline + '\n'
				s.curline++
			}
			s.mem.attribute[key].prompt = l1
		  println(term.bold(term.green('------------------')))
			println(l1)
			println(key)
			println(s.mem.attribute[key].prompt)
		  println(term.bold(term.green('------------------')))
		  s.curline++
	  }
	  else if s.line.left(6) == 'PROMPT' {
			mut runline := ''
			mut l1 := ''
			key := s.line.substr(6, s.line.len).trim_space()
			if key in s.mem.attribute {
			  l1 = s.mem.attribute[key].prompt  + '\n'
			  println(term.bold(term.yellow('--------got it----------')))
			}
			s.curline++
			for {
				runline = s.lines[s.curline].trim_space()
				if runline == '.' {
					break
				}
				l1 = l1 + runline + '\n'
				s.curline++
			}
			s.mem.attribute[key].prompt = l1
		  println(term.bold(term.yellow('------------------')))
			println(l1)
			println(key)
			println(s.mem.attribute[key].prompt)
		  println(term.bold(term.yellow('------------------')))
		  s.curline++
	  }
	  else if s.line.left(9) == 'DEFAULTCF' {
			typ = Keywords.DEFAULTCF
		  s.curline++
	  }
	  else if s.line == '' {
			typ = Keywords.DEFAULTCF
		  s.curline++
	  }
	  else {
	    //mut atline := s.curline + 1
	    //println('Error in: '+atline.str()+' Line: '+s.line.trim_space())
	    //println('At: '+s.linepos.str())
		  s.curline++
	  }


		//println(l.trim_space())
	}
  s.lines.free()
	return true
}



fn main() {
	mut x := new_scanner('DISCOUNT1.KB')
	b := x.mexparse()
	println(term.bold(term.red('It Worked!')))
	println('hello world')
	println(x.line)
	if b {
		println("hello world")
	}
}