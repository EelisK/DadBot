#!/usr/bin/env ruby

require_relative 'dadbot'

# Create new bot
BOT = DadBot.new

# Start update loop
BOT.subscribe
