"
Define the light theme.
"
Class {
	#name : 'StWelcomeLightTheme',
	#superclass : 'StWelcomeTheme',
	#category : 'NewTools-WelcomeBrowser-Themes',
	#package : 'NewTools-WelcomeBrowser',
	#tag : 'Themes'
}

{ #category : 'private' }
StWelcomeLightTheme >> imageFileName [

	^ 'light.png'
]

{ #category : 'accessing' }
StWelcomeLightTheme >> label [

	^ 'Light'
]

{ #category : 'accessing' }
StWelcomeLightTheme >> themeClass [

	^ PharoLightTheme
]
