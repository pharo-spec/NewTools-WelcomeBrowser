"
A style contributor with welcome browser specifics
"
Class {
	#name : 'StWelcomeStyleContributor',
	#superclass : 'StPharoStyleContributor',
	#category : 'NewTools-WelcomeBrowser-Styles',
	#package : 'NewTools-WelcomeBrowser',
	#tag : 'Styles'
}

{ #category : 'styles' }
StWelcomeStyleContributor >> styleSheetContribution [

	^ SpStyleVariableSTONReader fromString: '.application [
	.welcome [ Draw { #backgroundColor: EnvironmentColor(#background) } ],
	.topicNavigation [ Draw { #backgroundColor: #transparent } ],
	.topicNavigationHover [ Draw { #backgroundColor: #red } ],
	.welcomeThemeImage [ 
		Geometry { #minHeight: 180 },
		Container { #borderWidth : 0 } ],
	.welcomeThemeSelected [ 
		Container { #borderWidth : 2, #borderColor : #cyan } ] ] 
]'
]
