require.config
	
	baseUrl: 'lib'

	paths:

		# Application paths
		app:        '../app/js'
		templates:  '../app/templates'

		# General Libs
		bootstrap:            'bootstrap/js/bootstrap'
		handlebars:           'handlebars/js/handlebars'
		jquery:               'jquery/js/jquery'
		'jquery.backstretch': 'jquery.backstretch/js/jquery.backstretch.min'

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

		'jquery.backstretch':
			deps: ['jquery']

		bootstrap:
			deps: ['jquery']


require ['app/app', 'bootstrap'], ( Leagalytics ) ->

	Leagalytics.start()