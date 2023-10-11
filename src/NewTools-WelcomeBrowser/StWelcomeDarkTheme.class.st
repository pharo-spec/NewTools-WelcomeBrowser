"
Define the dark theme
"
Class {
	#name : 'StWelcomeDarkTheme',
	#superclass : 'StWelcomeTheme',
	#category : 'NewTools-WelcomeBrowser',
	#package : 'NewTools-WelcomeBrowser'
}

{ #category : 'private' }
StWelcomeDarkTheme >> imageFileName [

	^ 'dark.png'
]

{ #category : 'accessing' }
StWelcomeDarkTheme >> label [

	^ 'Dark'
]

{ #category : 'accessing' }
StWelcomeDarkTheme >> themeClass [

	^ PharoDarkTheme
]
