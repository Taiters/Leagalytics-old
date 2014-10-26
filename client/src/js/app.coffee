define ['marionette'], ( Marionette ) ->

	Leagalytics = new Backbone.Marionette.Application();

	Leagalytics.addRegions
		rootRegion: 'body'

	Leagalytics.navigate = ( route, options = {} ) ->

		Backbone.history.navigate route, options


	Leagalytics.setLayout = ( layout ) -> 

		Leagalytics.rootRegion.show layout


	Leagalytics.getLayout = () -> 

		Leagalytics.rootRegion.currentView


	Leagalytics.getCurrentRoute = () -> 

		Backbone.history.fragment


	Leagalytics.startSubApp = ( appName, args ) ->

		currentApp = Leagalytics.module appName if appName

		return if Leagalytics.currentApp == currentApp 

		Leagalytics.currentApp.stop() if Leagalytics.currentApp

		Leagalytics.currentApp = currentApp

		currentApp.start args if currentApp


	Leagalytics.on 'start', () ->

		if Backbone.history

			require ['app/session/app', 'app/summoner/app'], () ->

				Backbone.history.start()

				summoner = Leagalytics.request 'summoner:current'
				
				unless summoner

					Leagalytics.trigger 'login:login'

				else

					Leagalytics.trigger 'login:hello'
				


	window.Leagalytics = Leagalytics

	return Leagalytics;