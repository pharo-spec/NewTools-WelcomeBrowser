Class {
	#name : #StWelcomeTopicContainerPresenter,
	#superclass : #StWelcomeTopicPresenter,
	#category : #'NewTools-WelcomeBrowser'
}

{ #category : #accessing }
StWelcomeTopicContainerPresenter >> contentPresenter: aPresenter [

	contentPresenter := aPresenter.
	contentPresenter owner: self
]
