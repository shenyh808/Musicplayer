require 'net/http'
require 'json'
require 'pry'
require "MusicPlayer"
require 'dotenv/load'

require_relative "./lib/api"
require_relative "./lib/artist"
require_relative './lib/CLI'
require_relative './lib/genre'
require_relative './lib/song'
require_relative './lib/playlist'