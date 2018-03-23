# frozen_string_literal: true

# https://github.com/thuehlinger/daemons
require 'daemons'

Daemons.run('forex_server/forex.rb')
