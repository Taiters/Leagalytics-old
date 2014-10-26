define ['app/app', 'app/summoner/entities'], ( Leagalytics, Entities ) ->

	Leagalytics.module 'SummonerApp', ( SummonerApp, Leagalytics, Backbone, Marionette, $, _ ) ->

		SummonerApp.onStart = () ->

			@loadSummoner()

			Leagalytics.reqres.setHandler 'summoner:current', () =>

				return @summoner


		SummonerApp.loadSummoner = () ->

			summoners = new Entities.SummonerCollection();

			summoners.fetch()

			if !summoners.isEmpty()

				@summoner = summoners.first()

			else

				@summoner = null


