define ['app/app', 'app/session/layout'], ( Leagalytics, Layout ) ->

	Leagalytics.module 'SessionApp', ( SessionApp, Leagalytics, Backbone, Marionette, $, _ ) ->

		SessionApp.startWithParent = false

		SessionApp.onStart = () ->

			layout = new Layout();
			Leagalytics.setLayout layout


	Leagalytics.module 'Routers.SessionApp', ( SessionAppRouter, Leagalytics, Backbone, Marionette, $, _ ) ->

		SessionAppRouter.Router = Marionette.AppRouter.extend

			appRoutes:

				"login": "create"

		executeAction = ( action, args ) ->

			Leagalytics.startSubApp 'SessionApp'
			action args


		controller =

			create: () ->

				require ['app/session/controller'], ( Controller ) ->

					executeAction Controller.create

		@listenTo Leagalytics, 'session:create', () ->

			Leagalytics.navigate 'login'
			controller.session()

		@listenTo Leagalytics, 'session:store', ( input ) =>

			Leagalytics.commands.execute 'summoner:setCurrent', input


		Leagalytics.addInitializer () ->

			new SessionAppRouter.Router

				controller: controller

