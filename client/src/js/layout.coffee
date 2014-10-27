define ['app/app', 'templates/layout'], ( Leagalytics, layout ) ->

	Marionette.LayoutView.extend

		template: layout

		regions:
			header: '#header-region'
			content: '#content-region'