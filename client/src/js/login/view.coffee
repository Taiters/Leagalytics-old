define ['app/app', 'templates/login/form'], ( Leagalytics, form ) ->

	Marionette.ItemView.extend

		template: form

		events:
			'submit #summoner-name-form': 'sayHello'

		ui:
			summonerName: 'input#summoner-name'

		sayHello: (e) ->

			e.preventDefault()
			e.stopPropagation()
			
			name = @ui.summonerName.val()

			@trigger 'login:hello', name
