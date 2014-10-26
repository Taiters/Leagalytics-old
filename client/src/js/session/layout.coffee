define ['app/app', 'templates/session/layout', 'jquery.backstretch'], ( Leagalytics, layout ) ->

	Marionette.LayoutView.extend

		template: layout

		regions:
			panel: '#panel-region'

		onShow: () ->

			$.backstretch ["/img/1.jpg"],
				fade: 1000
				duration: 8000