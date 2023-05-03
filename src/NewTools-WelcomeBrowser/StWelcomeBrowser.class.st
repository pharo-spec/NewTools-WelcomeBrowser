"
A welcome browser for the Pharo system.

"
Class {
	#name : #StWelcomeBrowser,
	#superclass : #StPresenter,
	#instVars : [
		'changesPanel',
		'learnPanel',
		'explorePanel',
		'gettingHelpPanel',
		'moreDocumentationPanel',
		'welcomePanel',
		'topicsList',
		'contentPanel',
		'millerList',
		'paginator'
	],
	#category : #'NewTools-WelcomeBrowser'
}

{ #category : #accessing }
StWelcomeBrowser class >> logo [

	^ self iconNamed: #pharoBig
]

{ #category : #'world menu' }
StWelcomeBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'Welcome to Pharo')
		parent: #PharoHelp;
		order: 1;
		action: [ self open ];
		icon: ((self iconNamed: #pharoIcon) scaledToSize: 16@16);
		help: 'Welcome window for Pharo'
]

{ #category : #'instance creation' }
StWelcomeBrowser class >> open [
	<script>
	
	self new open
]

{ #category : #'instance creation' }
StWelcomeBrowser class >> openForRelease [
	<script>
	| window |
	
	window := self new open.
	"HACK: reset extent and position because it seems to not being taken 
	 into account before opening. Using directly the morphic widget, as we 
	 know we are still in morphic world."
	window withAdapterDo: [ :anAdapter | 
		anAdapter widget
			position: ((self currentWorld extent - self windowExtent) / 2) asIntegerPoint;
			extent: self windowExtent ]		
]

{ #category : #accessing }
StWelcomeBrowser class >> windowExtent [

	^ 700@550
]

{ #category : #private }
StWelcomeBrowser >> addPresenter: aPresenter [

	millerList addPresenter: aPresenter.
	paginator addPage: aPresenter
]

{ #category : #'accessing - contents' }
StWelcomeBrowser >> changesContent [

	^ 'TODO'
]

{ #category : #'accessing - labels' }
StWelcomeBrowser >> changesLabel [

	^ 'Changes in Pharo ', self version
]

{ #category : #initialization }
StWelcomeBrowser >> connectPresenters [

]

{ #category : #layout }
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

{ #category : #'accessing - contents' }
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

{ #category : #'accessing - labels' }
StWelcomeBrowser >> helpLabel [

	^ 'Getting Help'
]

{ #category : #initialization }
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

{ #category : #initialization }
StWelcomeBrowser >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Welcome';
		"initialExtent: self class windowExtent;"
		bindKeyCombination: Character arrowRight asKeyCombination toAction: [ self selectNext ]; 
		bindKeyCombination: Character arrowLeft asKeyCombination toAction: [ self selectPrevious ]"; 
		centered"
]

{ #category : #private }
StWelcomeBrowser >> newContainerTopic [ 

	^ self instantiate: StWelcomeTopicContainerPresenter
]

{ #category : #private }
StWelcomeBrowser >> newMicrodownTopic [ 

	^ self instantiate: StWelcomeTopicMicrodownPresenter
]

{ #category : #initialization }
StWelcomeBrowser >> newTopicFrom: aTopic [

	^ self 
		instantiate: StWelcomeTopicPresenter 
		on: aTopic
]

{ #category : #private }
StWelcomeBrowser >> newTopicTitle: aTitle contents: aString [
	
	^ self newMicrodownTopic 
		title: aTitle;
		contents: aString;
		yourself
]

{ #category : #private }
StWelcomeBrowser >> newTopicTitle: aTitle presenterClass: aClass [
	
	^ self newContainerTopic 
		title: aTitle;
		contentPresenter: aClass new;
		yourself
]

{ #category : #private }
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

{ #category : #private }
StWelcomeBrowser >> selectNext [ 

	(paginator selectedPage = millerList pages size) ifTrue: [ ^ self ].
	self selectPage: paginator selectedPage + 1
]

{ #category : #private }
StWelcomeBrowser >> selectPage: aNumber [

	paginator selectPage: aNumber.
	(millerList pages at: paginator selectedPage) takeKeyboardFocus
]

{ #category : #private }
StWelcomeBrowser >> selectPrevious [

	paginator selectedPage = 1 ifTrue: [ ^ self ].
	self selectPage: paginator selectedPage - 1
]

{ #category : #'accessing - labels' }
StWelcomeBrowser >> setupLabel [

	^ 'Quick Setup'
]

{ #category : #private }
StWelcomeBrowser >> topics [

	^ {
	self newTopicTitle: self welcomeLabel contents: self welcomeContent.
	self newTopicTitle: self helpLabel presenterClass: StWelcomeSetupPresenter.
	"self newTopicTitle: self setupLabel contents: self setupContent."
	self newTopicTitle: self helpLabel contents: self helpContent. 
	self newTopicTitle: self changesLabel contents: self changesContent. 
	}
]

{ #category : #initialization }
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

{ #category : #private }
StWelcomeBrowser >> version [

	^ '11'
]

{ #category : #'accessing - contents' }
StWelcomeBrowser >> welcomeContent [

	^ '# Welcome to Pharo 11

![StWelcomeBrowser class](pharo:///StWelcomeBrowser/logo)

Welcome to Pharo, an immersive live programming environment.

Pharo is a pure object-oriented programming language and a powerful environment, focused on simplicity and immediate feedback (think IDE and OS rolled into one).

For more information, please visit here: [http://pharo.org](http://pharo.org)'
]

{ #category : #'accessing - labels' }
StWelcomeBrowser >> welcomeLabel [

	^ 'Welcome to Pharo ', self version
]
