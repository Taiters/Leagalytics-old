define ['app/app', 'app/dashboard/home'], ( Leagalytics, HomeView ) ->

	Leagalytics.module 'DashboardApp.Controller', ( Controller, Leagalytics, Backbone, Marionette, $, _ ) ->

		Controller.home = () ->

			summoner = Leagalytics.request 'summoner:current'


			homeView = new HomeView
				model: summoner

			Leagalytics.getLayout().content.show homeView


	return Leagalytics.DashboardApp.Controller