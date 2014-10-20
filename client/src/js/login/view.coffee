define ['app/app', 'templates/login/summoner'], ( Leagalytics, summoner ) ->

	Marionette.ItemView.extend

		template: summoner

		events:
			'submit #summoner-name-form': 'sayHello'

		ui:
			summonerName: 'input#summoner-name'

		sayHello: (e) ->

			e.preventDefault()
			e.stopPropagation()
			
			name = @ui.summonerName.val()

			@trigger 'login:hello', name
