"
Define the dark theme
"
Class {
	#name : #StWelcomeDarkTheme,
	#superclass : #StWelcomeTheme,
	#category : #'NewTools-WelcomeBrowser-Base'
}

{ #category : #private }
StWelcomeDarkTheme >> imageFileName [

	^ 'dark.png'
]

{ #category : #accessing }
StWelcomeDarkTheme >> label [

	^ 'Dark'
]

{ #category : #accessing }
StWelcomeDarkTheme >> themeClass [

	^ PharoDarkTheme
]
