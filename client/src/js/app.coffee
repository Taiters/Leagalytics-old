define ['marionette', 'app/layout'], ( Marionette, Layout ) ->

	Leagalytics = new Backbone.Marionette.Application();

	Leagalytics.addRegions
		rootRegion: 'body'

	Leagalytics.navigate = ( route, options = {} ) ->

		Backbone.history.navigate route, options


	Leagalytics.setLayout = ( layout ) -> 

		Leagalytics.rootRegion.show layout

	Leagalytics.getDefaultLayout = () -> new Layout()


	Leagalytics.getLayout = () -> 

		Leagalytics.rootRegion.currentView


	Leagalytics.getCurrentRoute = () -> 

		Backbone.history.fragment

	Leagalytics.login = ( input ) ->

		Leagalytics.commands.execute 'summoner:setCurrent', input
		Leagalytics.trigger 'dashboard:home'

	Leagalytics.logout = () ->

		Leagalytics.commands.execute 'summoner.clearCurrent'
		Leagalytics.trigger 'session:create'

	Leagalytics.getAppLayout = ( appName ) ->

		if Leagalytics.currentApp && typeof(Leagalytics.currentApp.getLayout) == 'function'

			Leagalytics.currentApp.getLayout()

		else

			Leagalytics.getDefaultLayout()

	Leagalytics.startSubApp = ( appName, args ) ->

		currentApp = Leagalytics.module appName if appName

		return if Leagalytics.currentApp == currentApp 

		Leagalytics.currentApp.stop() if Leagalytics.currentApp

		Leagalytics.currentApp = currentApp

		currentApp.start args if currentApp

		Leagalytics.setLayout Leagalytics.getAppLayout()


	Leagalytics.on 'start', () ->

		if Backbone.history

			require [
				'app/session/app', 
				'app/dashboard/app',
				'app/summoner/app'
			], () ->

				Backbone.history.start()

				summoner = Leagalytics.request 'summoner:current'

				unless summoner

					Leagalytics.trigger 'login:login'

				else

					Leagalytics.trigger 'dashboard:home'
				

	Leagalytics.commands.setHandler 'navigation:invalid', () -> Leagalytics.trigger 'dashboard:home'

	return Leagalytics;