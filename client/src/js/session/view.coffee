define ['app/app', 'templates/session/create'], ( Leagalytics, form ) ->

	Marionette.ItemView.extend

		template: form

		events:
			'submit #summoner-name-form': 'submit'

		ui:
			summonerName: 'input#summoner-name'
			summonerRegion: 'select#summoner-region'

		submit: (e) ->

			e.preventDefault()
			e.stopPropagation()
			
			name = @ui.summonerName.val()
			region = @ui.summonerRegion.val()

			@trigger 'session:submit',
				name: name
				region: region
