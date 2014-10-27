define ['app/app'], ( Leagalytics ) ->

	Leagalytics.module 'DashboardApp', ( DashboardApp, Leagalytics, Backbone, Marionette, $, _ ) ->

		DashboardApp.startWithParent = false


	Leagalytics.module 'Routers.DashboardApp', ( DashboardAppRouter, Leagalytics, Backbone, Marionette, $, _ ) ->

		DashboardAppRouter.Router = Marionette.AppRouter.extend

			appRoutes:

				"": "home"

		executeAction = ( action, args ) ->

			Leagalytics.startSubApp 'DashboardApp'
			action args


		controller =

			home: () ->

				require ['app/dashboard/controller'], ( Controller ) ->

					executeAction Controller.home

		@listenTo Leagalytics, 'dashboard:home', () ->

			Leagalytics.navigate ''
			controller.home()


		Leagalytics.addInitializer () ->

			new DashboardAppRouter.Router

				controller: controller

