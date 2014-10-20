define ['marionette'], ( Marionette ) ->

	Leagalytics = new Backbone.Marionette.Application();

	Leagalytics.addRegions
		rootRegion: 'body'

	Leagalytics.navigate = ( route, options = {} ) ->

		Backbone.history.navigate route, options

	Leagalytics.getCurrentRoute = () -> Backbone.history.fragment


	Leagalytics.startSubApp = ( appName, args ) ->

		currentApp = Leagalytics.module appName if appName

		return if Leagalytics.currentApp == currentApp 

		Leagalytics.currentApp.stop() if Leagalytics.currentApp

		Leagalytics.currentApp = currentApp

		currentApp.start args if currentApp


	Leagalytics.on 'start', () ->

		if Backbone.history

			require ['app/login/app'], () ->

				Backbone.history.start()

	window.Leagalytics = Leagalytics

	return Leagalytics;