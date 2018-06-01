[![Maintainability](https://api.codeclimate.com/v1/badges/541a8d7ec8cb6254e8f5/maintainability)](https://codeclimate.com/github/workshop-team/forex/maintainability)
[![CircleCI](https://circleci.com/gh/workshop-team/forex.svg?style=shield)](https://circleci.com/gh/workshop-team/forex)

# README

* Required 'Redis'
* Rename .env_sample to .env and set up configuration
* It's importend to add seeds ``` rake db:seed ```
* After starting rails app using ` rails s ` run ForexServer `ruby forex_server/forex_daemon.rb start` in new terminal
* If you want see infos generating from ForexServer use `ruby forex_server/forex_daemon.rb run` (ruby forex_server/forex_daemon.rb start | stop | run | status).
