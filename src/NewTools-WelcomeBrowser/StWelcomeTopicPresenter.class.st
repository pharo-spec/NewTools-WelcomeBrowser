Class {
	#name : #StWelcomeTopicPresenter,
	#superclass : #SpPresenter,
	#traits : 'SpTActivable + SpTModel',
	#classTraits : 'SpTActivable classTrait + SpTModel classTrait',
	#instVars : [
		'contentPresenter',
		'previousPresenter',
		'nextPresenter',
		'hasPrevious',
		'hasNext',
		'nextBlock',
		'previousBlock',
		'titlePresenter'
	],
	#category : #'NewTools-WelcomeBrowser'
}

{ #category : #'private - actions' }
StWelcomeTopicPresenter >> activate [
	"Perform here the activation. A common usage would be something like:

	self activationAction ifNil: [ ^ self ].
	self activationAction cull: (SpActivatedSelection newValue: 42)
	"
]

{ #category : #layout }
StWelcomeTopicPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
]

{ #category : #accessing }
StWelcomeTopicPresenter >> hasPrevious: prevBoolean hasNext: nextBoolean [

	hasPrevious := prevBoolean.
	hasNext := nextBoolean.
	self updatePresenter
]

{ #category : #initialization }
StWelcomeTopicPresenter >> imageFor: aSymbol [
	
	aSymbol = #previous ifTrue: [ ^ self iconNamed: #smallBack ].
	aSymbol = #next ifTrue: [ ^ self iconNamed: #smallForward ].	
	
	self error: 'Should not arrive here'
]

{ #category : #initialization }
StWelcomeTopicPresenter >> initialize [

	hasPrevious := false.
	hasNext := false.
	super initialize
]

{ #category : #initialization }
StWelcomeTopicPresenter >> initializePresenters [

	previousPresenter := self 
		newNavigationTo: #previous 
		do: [ self selectPrevious ].
	nextPresenter := self 
		newNavigationTo: #next 
		do: [ self selectNext ]
]

{ #category : #initialization }
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
	
	^ navigationPresenter
]

{ #category : #private }
StWelcomeTopicPresenter >> selectNext [

	nextBlock value
]

{ #category : #private }
StWelcomeTopicPresenter >> selectPrevious [

	previousBlock value
]

{ #category : #accessing }
StWelcomeTopicPresenter >> title: aTitle [
]

{ #category : #initialization }
StWelcomeTopicPresenter >> updatePresenter [
	| newLayout |

	newLayout := SpBoxLayout newLeftToRight.
	hasPrevious ifTrue: [ 
		newLayout add: previousPresenter expand: false ].
	newLayout add: contentPresenter.
	hasNext ifTrue: [  
		newLayout add: nextPresenter expand: false ].
	self layout: newLayout
]

{ #category : #enumerating }
StWelcomeTopicPresenter >> whenNextDo: aBlock [

	nextBlock := aBlock
]

{ #category : #enumerating }
StWelcomeTopicPresenter >> whenPreviousDo: aBlock [

	previousBlock := aBlock
]
