define ['app/app', 'backbone.localStorage'], ( Leagalytics ) ->

	Leagalytics.module 'Summoner.Entities', ( Entities, Leagalytics, Backbone, Marionette, $, _ ) ->

		Entities.Summoner = Backbone.Model.extend

			localStorage: new Backbone.LocalStorage( "summoner" )


		Entities.SummonerCollection = Backbone.Collection.extend

			localStorage: new Backbone.LocalStorage( "summoner" )
			model:        Entities.Summoner


	return Leagalytics.Summoner.Entities
