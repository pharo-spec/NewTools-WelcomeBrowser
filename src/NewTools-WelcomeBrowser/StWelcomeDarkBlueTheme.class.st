"
Define the dark blue theme
"
Class {
	#name : 'StWelcomeDarkBlueTheme',
	#superclass : 'StWelcomeTheme',
	#category : 'NewTools-WelcomeBrowser-Themes',
	#package : 'NewTools-WelcomeBrowser',
	#tag : 'Themes'
}

{ #category : 'private' }
StWelcomeDarkBlueTheme >> imageFileName [

	^ 'darkblue.png'
]

{ #category : 'accessing' }
StWelcomeDarkBlueTheme >> label [

	^ 'Dark Blue'
]

{ #category : 'accessing' }
StWelcomeDarkBlueTheme >> themeClass [

	^ DarkBlueTheme 
]
