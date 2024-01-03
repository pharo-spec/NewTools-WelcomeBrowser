"
Define the dark theme
"
Class {
	#name : 'StWelcomeDarkTheme',
	#superclass : 'StWelcomeTheme',
	#category : 'NewTools-WelcomeBrowser-Themes',
	#package : 'NewTools-WelcomeBrowser',
	#tag : 'Themes'
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
