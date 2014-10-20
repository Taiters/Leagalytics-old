require.config
	
	baseUrl: 'lib'

	paths:

		# Application paths
		app:        '../app/js'
		templates:  '../app/templates'

		# General Libs
		handlebars: 'handlebars/js/handlebars'
		jquery:     'jquery/js/jquery'

		# Libs required by Marionette
		backbone:              'backbone/js/backbone'
		marionette:            'marionette/js/backbone.marionette'
		underscore:            'underscore/js/underscore'
		'backbone.babysitter': 'backbone.babysitter/js/backbone.babysitter'
		'backbone.wreqr':      'backbone.wreqr/js/backbone.wreqr'

	shim:

		underscore:
			exports: "_"

		backbone:
			deps:    ["jquery", "underscore"]
			exports: "Backbone"

		marionette:
			deps:    ["backbone"]
			exports: "Marionette"


require ['app/app'], ( LeagalyticsApp ) ->

	LeagalyticsApp.start()