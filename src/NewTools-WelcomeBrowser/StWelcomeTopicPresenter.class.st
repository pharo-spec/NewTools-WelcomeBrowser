"
A base for all welcome browser topics, it define navigation stuff and some common usage things.
"
Class {
	#name : 'StWelcomeTopicPresenter',
	#superclass : 'SpPresenter',
	#traits : 'SpTActivable + SpTModel',
	#classTraits : 'SpTActivable classTrait + SpTModel classTrait',
	#instVars : [
		'contentPresenter',
		'previousPresenter',
		'nextPresenter',
		'hasPrevious',
		'hasNext',
		'nextBlock',
		'previousBlock'
	],
	#category : 'NewTools-WelcomeBrowser-Presenters',
	#package : 'NewTools-WelcomeBrowser',
	#tag : 'Presenters'
}

{ #category : 'private - actions' }
StWelcomeTopicPresenter >> activate [
	"Perform here the activation. A common usage would be something like:

	self activationAction ifNil: [ ^ self ].
	self activationAction cull: (SpActivatedSelection newValue: 42)
	"
]

{ #category : 'api - focus' }
StWelcomeTopicPresenter >> defaultKeyboardFocus [

	^ contentPresenter
]

{ #category : 'layout' }
StWelcomeTopicPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: previousPresenter expand: false;
		add: contentPresenter;
		add: nextPresenter expand: false;
		yourself
]

{ #category : 'accessing' }
StWelcomeTopicPresenter >> hasPrevious: prevBoolean hasNext: nextBoolean [

	hasPrevious := prevBoolean.
	hasNext := nextBoolean.
	self updatePresenter
]

{ #category : 'initialization' }
StWelcomeTopicPresenter >> imageFor: aSymbol [
	
	aSymbol = #previous ifTrue: [ ^ self iconNamed: #smallBack ].
	aSymbol = #next ifTrue: [ ^ self iconNamed: #smallForward ].	
	
	self error: 'Should not arrive here'
]

{ #category : 'initialization' }
StWelcomeTopicPresenter >> initialize [

	hasPrevious := false.
	hasNext := false.
	super initialize
]

{ #category : 'initialization' }
StWelcomeTopicPresenter >> initializePresenters [

	previousPresenter := self 
		newNavigationTo: #previous 
		do: [ self selectPrevious ].
	nextPresenter := self 
		newNavigationTo: #next 
		do: [ self selectNext ]
]

{ #category : 'initialization' }
StWelcomeTopicPresenter >> newNavigationTo: aSymbol do: aBlock [  
	| navigationPresenter imagePresenter |

	navigationPresenter := self newPresenter
		addStyle: 'topicNavigation';
		layout: (SpBoxLayout newTopToBottom
			borderWidth: 10;
			vAlignCenter;
			yourself);
		yourself.
	
	imagePresenter := 	navigationPresenter newImage 
		image: (self imageFor: aSymbol) asGrayScaleWithAlpha;
		yourself.
	navigationPresenter layout add: imagePresenter.
	
	navigationPresenter eventHandler	
		whenMouseDownDo: [ :anEvent | aBlock value ];
		whenMouseEnterDo: [ :anEvent | 
			imagePresenter image: (self imageFor: aSymbol).
			"navigationPresenter addStyle: 'topicNavigationHover'" ];
		whenMouseLeaveDo: [ :anEvent |
			imagePresenter image: ((self imageFor: aSymbol) asGrayScaleWithAlpha).
			"navigationPresenter removeStyle: 'topicNavigationHover'" ]. 
	
	navigationPresenter hide.
	
	^ navigationPresenter
]

{ #category : 'private' }
StWelcomeTopicPresenter >> selectNext [

	nextBlock value
]

{ #category : 'private' }
StWelcomeTopicPresenter >> selectPrevious [

	previousBlock value
]

{ #category : 'accessing' }
StWelcomeTopicPresenter >> title: aTitle [
]

{ #category : 'initialization' }
StWelcomeTopicPresenter >> updatePresenter [

	hasPrevious ifTrue: [ previousPresenter show ].
	hasNext ifTrue: [ nextPresenter show ]
]

{ #category : 'enumerating' }
StWelcomeTopicPresenter >> whenNextDo: aBlock [

	nextBlock := aBlock
]

{ #category : 'enumerating' }
StWelcomeTopicPresenter >> whenPreviousDo: aBlock [

	previousBlock := aBlock
]
