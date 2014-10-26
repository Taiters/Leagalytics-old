define ['app/app', 'app/session/view'], ( Leagalytics, CreateView ) ->

	Leagalytics.module 'SessionApp.Controller', ( Controller, Leagalytics, Backbone, Marionette, $, _ ) ->

		Controller.create = () ->

			sessionView = new CreateView()

			Leagalytics.getLayout().panel.show sessionView

			sessionView.on 'session:submit', ( input ) ->

				Leagalytics.trigger 'session:store', input


	return Leagalytics.SessionApp.Controller