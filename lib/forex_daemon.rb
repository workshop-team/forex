# frozen_string_literal: true

# https://github.com/thuehlinger/daemons
require 'daemons'

Daemons.run('lib/forex.rb')
# Daemons.run('forex2.rb')
