define ['app/app', 'app/summoner/entities'], ( Leagalytics, Entities ) ->

	Leagalytics.module 'SummonerApp', ( SummonerApp, Leagalytics, Backbone, Marionette, $, _ ) ->

		SummonerApp.onStart = () ->

			@loadSummoner()

			Leagalytics.reqres.setHandler 'summoner:current', () =>

				return @summoner

			Leagalytics.commands.setHandler 'summoner:setCurrent', ( summoner ) =>

				if summoner.name && summoner.region

					@setSummoner summoner.name, summoner.region

			Leagalytics.commands.setHandler 'summoner.clearCurrent', () =>

				@clearSummoner()



		SummonerApp.loadSummoner = () ->

			@summoners = new Entities.SummonerCollection()
			@summoners.fetch()

			if !@summoners.isEmpty()

				@summoner = @summoners.first()

			else

				@summoner = null

		SummonerApp.setSummoner = ( name, region ) ->

			@summoner = @summoners.create
				name: name
				region: region

		SummonerApp.clearSummoner = () ->

			@summoners.each (summoner) -> summoner.destroy()






