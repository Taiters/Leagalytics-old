define ['app/app', 'app/login/layout'], ( Leagalytics, Layout ) ->

	Leagalytics.module 'LoginApp', ( LoginApp, Leagalytics, Backbone, Marionette, $, _ ) ->

		LoginApp.startWithParent = false

		LoginApp.onStart = () ->

			layout = new Layout();
			Leagalytics.setLayout layout


	Leagalytics.module 'Routers.LoginApp', ( LoginAppRouter, Leagalytics, Backbone, Marionette, $, _ ) ->

		LoginAppRouter.Router = Marionette.AppRouter.extend

			appRoutes:

				"(login)": "login"
				"hello/:name": "hello"

		executeAction = ( action, args ) ->

			Leagalytics.startSubApp 'LoginApp'
			action args


		controller =

			login: () ->

				require ['app/login/controller'], ( Controller ) ->

					executeAction Controller.login

			hello: (name) ->

				require ['app/login/controller'], ( Controller ) ->

					executeAction Controller.hello, name

		@listenTo Leagalytics, 'login:login', () ->

			Leagalytics.navigate 'login'
			controller.login()

		@listenTo Leagalytics, 'login:hello', (name) =>

			Leagalytics.navigate "hello/#{name}"
			controller.hello name


		Leagalytics.addInitializer () ->

			new LoginAppRouter.Router

				controller: controller

