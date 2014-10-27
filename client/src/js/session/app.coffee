define ['app/app', 'app/session/layout'], ( Leagalytics, Layout ) ->

	Leagalytics.module 'SessionApp', ( SessionApp, Leagalytics, Backbone, Marionette, $, _ ) ->

		SessionApp.startWithParent = false

		SessionApp.getLayout = () -> new Layout();

		SessionApp.check = () ->

			summoner = Leagalytics.request 'summoner:current'

			if summoner

				Leagalytics.commands.execute 'navigation:invalid' 

				false

			else

				true

	Leagalytics.module 'Routers.SessionApp', ( SessionAppRouter, Leagalytics, Backbone, Marionette, $, _ ) ->

		SessionAppRouter.Router = Marionette.AppRouter.extend

			appRoutes:

				"login": "create"
				"logout": "destroy"

		executeAction = ( action, args ) ->

			Leagalytics.startSubApp 'SessionApp'
			action args


		controller =

			create: () ->

				if Leagalytics.SessionApp.check()

					require ['app/session/controller'], ( Controller ) ->

						executeAction Controller.create

			destroy: () ->

				Leagalytics.logout()

		@listenTo Leagalytics, 'session:create', () ->

			Leagalytics.navigate 'login'
			controller.create()

		@listenTo Leagalytics, 'session:store', ( input ) ->

			Leagalytics.login input

		@listenTo Leagalytics, 'session:destroy', () ->

			controller.destroy()


		Leagalytics.addInitializer () ->

			new SessionAppRouter.Router

				controller: controller

