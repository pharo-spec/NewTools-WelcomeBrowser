"
A topic that will contain subtopics (for example `StWelcomeSetupPresenter`)
"
Class {
	#name : 'StWelcomeTopicContainerPresenter',
	#superclass : 'StWelcomeTopicPresenter',
	#category : 'NewTools-WelcomeBrowser-Presenters',
	#package : 'NewTools-WelcomeBrowser',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
StWelcomeTopicContainerPresenter >> contentPresenter: aPresenter [

	contentPresenter := aPresenter.
	contentPresenter owner: self
]
