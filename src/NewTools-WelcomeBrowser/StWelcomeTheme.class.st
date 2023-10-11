"
Ennumeration for the different themes availabla (dark, light)
"
Class {
	#name : 'StWelcomeTheme',
	#superclass : 'Object',
	#instVars : [
		'image'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'NewTools-WelcomeBrowser',
	#package : 'NewTools-WelcomeBrowser'
}

{ #category : 'accessing' }
StWelcomeTheme class >> all [

	^ { self light. self dark }
]

{ #category : 'accessing' }
StWelcomeTheme class >> dark [

	^ StWelcomeDarkTheme uniqueInstance
]

{ #category : 'accessing' }
StWelcomeTheme class >> light [

	^ StWelcomeLightTheme uniqueInstance
]

{ #category : 'private - utils' }
StWelcomeTheme class >> loadAllImagesFrom: aDirectory [

	self all do: [ :each | 
		each loadImageFrom: aDirectory ]
]

{ #category : 'instance creation' }
StWelcomeTheme class >> uniqueInstance [

	self = StWelcomeTheme
		ifTrue: [ self error: 'Use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : 'accessing' }
StWelcomeTheme >> activate [

	self themeClass beCurrent
]

{ #category : 'accessing' }
StWelcomeTheme >> image [

	^ image
]

{ #category : 'private' }
StWelcomeTheme >> imageFileName [

	^ self subclassResponsibility
]

{ #category : 'testing' }
StWelcomeTheme >> isActive [

	^ UITheme current class = self themeClass
]

{ #category : 'accessing' }
StWelcomeTheme >> label [

	self subclassResponsibility
]

{ #category : 'private' }
StWelcomeTheme >> loadImageFrom: aDirectory [

	image := (aDirectory / self imageFileName) 
		binaryReadStreamDo: [ :stream | PNGReadWriter formFromStream: stream ]
]

{ #category : 'accessing' }
StWelcomeTheme >> themeClass [

	^ self subclassResponsibility
]
