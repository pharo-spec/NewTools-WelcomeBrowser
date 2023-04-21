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
		'contentPanel'
	],
	#category : #WelcomeBrowser
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

	topicsList transmitDo: [ :aTopic |
		self select: aTopic ]
]

{ #category : #layout }
StWelcomeBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom 
		borderWidth: 5;
		add: (SpPanedLayout newLeftToRight
			positionOfSlider: 30 percent;
			add: topicsList;
			add: contentPanel;
			yourself);
		yourself
]

{ #category : #'accessing - contents' }
StWelcomeBrowser >> helpContent [

	^ '# To Learn Pharo

## Getting help

Pharo has a vibrant community that shares knowledge in different ways: 

- The Pharo Users mailing list: [http://lists.pharo.org/mailman/listinfo/pharo-users_lists.pharo.org](http://lists.pharo.org/mailman/listinfo/pharo-users_lists.pharo.org)
- The Pharo Discord server: [https://discord.gg/QewZMZa](https://discord.gg/QewZMZa)

You can find more information, lists to browse/suscribe and places to share code at: 

[http://pharo.org/community](http://pharo.org/community)

## Using ProfStef 

You can learn Pharo by clicking on the following expression: 

```st
ProfStef go.
```
## Follow the MOOC

Pharo has an excellent MOOC (Massive Open Online Course). You can find more information here: 

[http://mooc.pharo.org](http://mooc.pharo.org)

Check the testimonies: they are great and fun. 

## Books

There are several free Pharo books that can be download here: 

[http://books.pharo.org](http://books.pharo.org)

A very interesting starting point would be looking into the "Updated Pharo by Example" free book. It is still a work in progress for Pharo 90, but most of it is already done.  
You can find the book here:

- [https://github.com/SquareBracketAssociates/UpdatedPharoByExample](https://github.com/SquareBracketAssociates/UpdatedPharoByExample)
- [https://github.com/SquareBracketAssociates/PharoByExample80](https://github.com/SquareBracketAssociates/PharoByExample80)

## Help

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

	topicsList := self newList.
	topicsList 
		items: self topics;
		display: [ :aTopic | aTopic key ];
		displayIcon: [ :aTopic | (self iconNamed: #glamorousBookmark) ].

	contentPanel := self instantiate: MicrodownPresenter
]

{ #category : #initialization }
StWelcomeBrowser >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Welcome';
		initialExtent: 800@550;
		centered
]

{ #category : #private }
StWelcomeBrowser >> select: aTopic [

	aTopic ifNil: [ 
		contentPanel text: ''.
		^ self ].

	contentPanel documentFromString: aTopic value
	
]

{ #category : #'accessing - contents' }
StWelcomeBrowser >> setupContent [

	^ '# Quick setup

Choose your preferred color theme: 
- `PharoLightTheme beCurrent` or `PharoDarkTheme beCurrent` 
- and  switch fullscreen mode executing  `Display toggleFullscreen`

Click if you have access to a: regular network connection or slow network
or if need to setup a network proxy.

You can also apply many other other settings by opening the `SettingBrowser open`.'
]

{ #category : #'accessing - labels' }
StWelcomeBrowser >> setupLabel [

	^ 'Quick Setup'
]

{ #category : #private }
StWelcomeBrowser >> topics [

	^ { 
	self welcomeLabel -> self welcomeContent.
	self setupLabel -> self setupContent.
	self helpLabel -> self helpContent. 
	self changesLabel -> self changesContent. 
	}
]

{ #category : #initialization }
StWelcomeBrowser >> updatePresenter [

	topicsList selectFirst
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
