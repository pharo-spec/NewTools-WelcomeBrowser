"
A welcome browser for the Pharo system.

"
Class {
	#name : 'StWelcomeBrowser',
	#superclass : 'StPresenter',
	#instVars : [
		'contentPanel',
		'millerList',
		'paginator'
	],
	#category : 'NewTools-WelcomeBrowser',
	#package : 'NewTools-WelcomeBrowser'
}

{ #category : 'accessing' }
StWelcomeBrowser class >> logo [

	^ self iconNamed: #pharoBig
]

{ #category : 'world menu' }
StWelcomeBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'Welcome to Pharo')
		parent: #PharoHelp;
		order: 1;
		action: [ self open ];
		icon: ((self iconNamed: #pharo) scaledToSize: (16@16) scaledByDisplayScaleFactor);
		help: 'Welcome window for Pharo'
]

{ #category : 'instance creation' }
StWelcomeBrowser class >> open [
	<script>
	
	self new open
]

{ #category : 'instance creation' }
StWelcomeBrowser class >> openForRelease [
	<script>
	| window |
	
	window := self new open.
	"HACK: reset extent and position because it seems to not being taken 
	 into account before opening. Using directly the morphic widget, as we 
	 know we are still in morphic world."
	window withAdapterDo: [ :anAdapter | 
		anAdapter widget
			position: (((self environment classNamed: #OSWorldRenderer) defaultExtent - self windowExtent) / 2) asIntegerPoint;
			extent: self windowExtent ]
]

{ #category : 'accessing' }
StWelcomeBrowser class >> windowExtent [

	^ (700@550) scaledByDisplayScaleFactor
]

{ #category : 'private' }
StWelcomeBrowser >> addPresenter: aPresenter [

	millerList addPresenter: aPresenter.
	paginator addPage: aPresenter
]

{ #category : 'accessing - contents' }
StWelcomeBrowser >> changesContent [

	^ '# Pharo 11 changes overview

A large international community of developers worked hard to prepare a new release of the Pharo platform.

## Highlights

### Tools
- Iceberg (the Git client/VCS control tool) has received a lot of tweaks and fixes to work better with GitHub and other remote control files.
- The debugger now incorporates a lot of tweaks and, notably, the capability of adding bindings in the context interaction model.
- TimeProfiler (the profiling tool) has a new UI and also incorporates the alternative Andreas Profiler.
- DrTests (the Test Runner alternative) has been improved and updated to the latest Spec.
- There is a new implementation of Rewrite tools. 
- There is a new tool: The Document Browser, which allows the visualization of Microdown (Markdown compatible) documents placed on the web or locally. 
- Calypso (the System Browser) has incorporated some interesting mini tools: package dependency and baseline visualization.
- We have introduced new and improved Inspectors, notably for AST/Blocks/IR, among others.
- All versions of NewTools, Spec, Roassal and Microdown have been updated with a lot of bug fixes. 

### System 
- Slots now have a Setting for unrestricted definitions.
- Slots now allow more complex Slot definitions (cascade).
- Compiler support for full blocks without outer context.
- We have enabled optionInlineTimesRepeat and optionInlineRepeat by default.
- Adding an API in OCBytecodeToASTCache, RBMethodNode and RBBlockNode to map AST nodes to a PC range.
- Add a "parse plugin" mechanism to OpalCompiler.
- Improve faulty parsing.
- A Lots of bug fixes and cleanups.
- Constant Block Closures are created at compile time (speeds up both creating and evaluation of [#blockslikethis])
- Support for ephemerons.
   
### Virtual machine
- Ephemerons are production ready (a large number of Ephemerons supported, leaks fixed, support for old finalization, tests).
- Improving the Memory Map of the VM (using constant positions).
- Initial support for Single-Instruction Multiple-Data (SIMD)
    - Initialization of new objects using SIMD (ARM64)
    - Adding Bytecode Extensions to support SIMD instructions
    - Adding Vector Registers
    - Vector Register bytecodes
- Third-Party Dependency Update (newer versions, graphic libraries using hardware acceleration).
- Fixing errors and simplification of primitives.
- Clean Ups: We have removed a significant amount of old code, notably old experiments, dead code, and unused code such as Newspeak and unused plugins.

## Status
Current Pharo development status:
1. 309 forks on GitHub
2. 972 issues closed since Pharo 10
3. 1412 Pull requests processed since Pharo 10, not counting separately managed projects:
- [http://github.com/pharo-spec/NewTools](http://github.com/pharo-spec/NewTools)
- [http://github.com/pharo-spec/NewTools-DocumentBrowser](http://github.com/pharo-spec/NewTools-DocumentBrowser)
- [http://github.com/pharo-spec/Spec](http://github.com/pharo-spec/Spec)
- [http://github.com/pharo-vcs/Iceberg](http://github.com/pharo-vcs/Iceberg)
- [http://github.com/ObjectProfile/Roassal3](http://github.com/ObjectProfile/Roassal3)
- [http://github.com/pillar-markup/Microdown](http://github.com/pillar-markup/Microdown)
- [http://github.com/pillar-markup/BeautifulComments](http://github.com/pillar-markup/BeautifulComments)
- [http://github.com/pharo-project/opensmalltalk-vm](http://github.com/pharo-project/opensmalltalk-vm)

## Contributors
We always say Pharo is yours. It is yours because we made it for you, but most importantly, because it is made by the invaluable contributions of our great community (yourself).  
A large community of people from all around the world contributed to Pharo 11.0 by making pull requests, reporting bugs, participating in discussion threads, providing feedback and more.  
Thank you all for your contributions!  

## Changelog

The complete list of changes can be viewed on a weekly basis [here](https://github.com/pharo-project/pharo-changelogs/tree/master/weekly).'
]

{ #category : 'accessing - labels' }
StWelcomeBrowser >> changesLabel [

	^ 'Changes in Pharo ', self version
]

{ #category : 'initialization' }
StWelcomeBrowser >> connectPresenters [

]

{ #category : 'layout' }
StWelcomeBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: millerList;
		add: (SpBoxLayout newLeftToRight 
				hAlignCenter;
				add: paginator;
				yourself) 
			expand: false;
		yourself
]

{ #category : 'accessing - contents' }
StWelcomeBrowser >> helpContent [

	^ '# Learn Pharo
  
### Getting help

Pharo has a vibrant community that shares knowledge in different ways: 

- The Pharo Users mailing list: [https://lists.pharo.org/list/pharo-users.lists.pharo.org](https://lists.pharo.org/list/pharo-users.lists.pharo.org)
- The Pharo Discord server: [https://discord.gg/QewZMZa](https://discord.gg/QewZMZa)

You can find more information, lists to browse/suscribe and places to share code at: 

[http://pharo.org/community](http://pharo.org/community)

### Using ProfStef
You can learn Pharo by clicking on the following expression: 

```pharoeval
ProfStef go.
```
  
### Follow the MOOC

Pharo has an excellent MOOC (Massive Open Online Course). You can find more information here: 

[http://mooc.pharo.org](http://mooc.pharo.org)

Check the testimonies: they are great and fun. 

### Books

There are several free Pharo books that can be download here: 

[http://books.pharo.org](http://books.pharo.org)

A very interesting starting point would be looking into the "Updated Pharo by Example" free book. It is still a work in progress for Pharo 90, but most of it is already done.  
You can find the book here:

- [https://github.com/SquareBracketAssociates/UpdatedPharoByExample](https://github.com/SquareBracketAssociates/UpdatedPharoByExample)
- [https://github.com/SquareBracketAssociates/PharoByExample80](https://github.com/SquareBracketAssociates/PharoByExample80)
### Help

A compendium of Pharo documentation can be found at: 

[http://pharo.org/documentation](http://pharo.org/documentation)

There you can find:
- Pharo books: [http://books.pharo.org](http://books.pharo.org)
- Screencasts: [https://www.youtube.com/channel/UCp3mNigANqkesFzdm058bvw](https://www.youtube.com/channel/UCp3mNigANqkesFzdm058bvw)
- Presentations: [http://www.slideshare.net/pharoproject/](http://www.slideshare.net/pharoproject/)'
]

{ #category : 'accessing - labels' }
StWelcomeBrowser >> helpLabel [

	^ 'Getting Help'
]

{ #category : 'initialization' }
StWelcomeBrowser >> initializePresenters [

	self addStyle: 'welcome'.

	millerList := self instantiate: SpMillerColumnPresenter.
	millerList  
		withoutHorizontalScrollBar;
		visiblePages: 1;
		spacing: 5.
		
	paginator := SpPaginatorPresenter new.
	paginator visiblePages: 1.
	paginator chainTo: millerList.
	paginator withoutResizingEdges
]

{ #category : 'initialization' }
StWelcomeBrowser >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Welcome';
		initialExtent: self class windowExtent;
		bindKeyCombination: Character arrowRight asKeyCombination toAction: [ self selectNext ]; 
		bindKeyCombination: Character arrowLeft asKeyCombination toAction: [ self selectPrevious ]; 
		centered
]

{ #category : 'private' }
StWelcomeBrowser >> newContainerTopic [ 

	^ self instantiate: StWelcomeTopicContainerPresenter
]

{ #category : 'private' }
StWelcomeBrowser >> newMicrodownTopic [ 

	^ self instantiate: StWelcomeTopicMicrodownPresenter
]

{ #category : 'initialization' }
StWelcomeBrowser >> newTopicFrom: aTopic [

	^ self 
		instantiate: StWelcomeTopicPresenter 
		on: aTopic
]

{ #category : 'private' }
StWelcomeBrowser >> newTopicTitle: aTitle contents: aString [
	
	^ self newMicrodownTopic 
		title: aTitle;
		contents: aString;
		yourself
]

{ #category : 'private' }
StWelcomeBrowser >> newTopicTitle: aTitle presenterClass: aClass [
	
	^ self newContainerTopic 
		title: aTitle;
		contentPresenter: aClass new;
		yourself
]

{ #category : 'private' }
StWelcomeBrowser >> select: aTopic [

	aTopic ifNil: [ 
		contentPanel text: ''.
		^ self ].

	self flag: #HACK. "I need to select an interval to force the text to 
	be at the begining, othewise it will show the last part"
	contentPanel 
		documentFromString: aTopic value; 
		selectionInterval: (1 to: 0)
	
]

{ #category : 'private' }
StWelcomeBrowser >> selectNext [ 

	(paginator selectedPage = millerList pages size) ifTrue: [ ^ self ].
	self selectPage: paginator selectedPage + 1
]

{ #category : 'private' }
StWelcomeBrowser >> selectPage: aNumber [

	paginator selectPage: aNumber.
	(millerList pages at: paginator selectedPage) takeKeyboardFocus
]

{ #category : 'private' }
StWelcomeBrowser >> selectPrevious [

	paginator selectedPage = 1 ifTrue: [ ^ self ].
	self selectPage: paginator selectedPage - 1
]

{ #category : 'accessing - labels' }
StWelcomeBrowser >> setupLabel [

	^ 'Quick Setup'
]

{ #category : 'private' }
StWelcomeBrowser >> topics [

	^ {
	self newTopicTitle: self welcomeLabel contents: self welcomeContent.
	self newTopicTitle: self helpLabel presenterClass: StWelcomeSetupPresenter.
	"self newTopicTitle: self setupLabel contents: self setupContent."
	self newTopicTitle: self helpLabel contents: self helpContent. 
	self newTopicTitle: self changesLabel contents: self changesContent. 
	}
]

{ #category : 'initialization' }
StWelcomeBrowser >> updatePresenter [
	| topics |

	topics := self topics.
	topics withIndexDo: [ :each :index |
		self addPresenter: (each
			hasPrevious: index > 1 hasNext: index < topics size;
			whenNextDo: [ self selectNext ];
			whenPreviousDo: [ self selectPrevious ];
			yourself) ].
	self selectPage: 1
]

{ #category : 'private' }
StWelcomeBrowser >> version [

	^ SystemVersion current major asString
]

{ #category : 'accessing - contents' }
StWelcomeBrowser >> welcomeContent [

	^ '# Welcome to Pharo ' , self version , '

![StWelcomeBrowser class](pharo:///StWelcomeBrowser/logo)

Welcome to Pharo, an immersive live programming environment.

Pharo is a pure object-oriented programming language and a powerful environment, focused on simplicity and immediate feedback (think IDE and OS rolled into one).

For more information, please visit here: [http://pharo.org](http://pharo.org)'
]

{ #category : 'accessing - labels' }
StWelcomeBrowser >> welcomeLabel [

	^ 'Welcome to Pharo ', self version
]
