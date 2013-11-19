#!/usr/bin/env ruby -I ../lib -I lib
# coding: utf-8

require 'bundler/setup'
Bundler.require

require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader'
require 'sinatra/cross_origin'
require "sinatra/jsonp"

require 'json'
require 'geocoder'
require 'ip'
require 'yaml'
require 'sanitize'
require 'data_mapper'

require 'resque'
require 'redis'

# Settings
set server: 'thin', connections: []
set :views, Proc.new { File.join(root, "app/views") }

# # Headers
# set :allow_origin, :any
# set :allow_methods, [:get, :post, :options]
# set :allow_credentials, true
# set :max_age, "1728000"

# Allow CORS
# set :protection, :except => :http_origin

# Setup DataMapper
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3::memory:")

# Models
require_relative 'app/models/site_map'
require_relative 'app/models/page'
require_relative 'app/models/asset'
require_relative 'app/models/link'

# Finalize DataMapper after initializing models
DataMapper.finalize
DataMapper.auto_upgrade!

# Controllers
require_relative 'app/controllers/base_controller'
require_relative 'app/controllers/site_maps_controller'
require_relative 'app/controllers/pages_controller'

# Crawler
require_relative 'lib/crawler'
require_relative 'lib/worker'