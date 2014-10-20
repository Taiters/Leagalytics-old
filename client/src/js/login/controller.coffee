define ['app/app', 'app/login/view', 'app/login/hello'], ( Leagalytics, LoginView, HelloView ) ->

	Leagalytics.module 'LoginApp.Controller', ( Controller, Leagalytics, Backbone, Marionette, $, _ ) ->

		Controller.login = () ->

			loginView = new LoginView()

			Leagalytics.LoginApp.layout.panel.show loginView

			loginView.on 'login:hello', ( name ) ->

				Leagalytics.trigger 'login:hello', name

		Controller.hello = (name) ->

			helloView = new HelloView
				model: new Backbone.Model
					name: name

			Leagalytics.LoginApp.layout.panel.show helloView


	return Leagalytics.LoginApp.Controller