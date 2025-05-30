# WMATA Ruby Client

Access the [WMATA API][wmata-api] with ruby.  You can use it to fetch information about Metro trains, buses, stations, and their various schedules.  Some resources (like train information) is realtime.

This project is still a WIP.

## Pre-requisites
1. A compatible ruby version (see `.ruby-version`)
1. Bundler
1. A WMATA API key.  You can either try their "trial" key or sign up with your email address to receive one.

## Getting Set Up
1. Clone this repo
1. `cd /path/to/wmata_client/`
1. Run `bin/setup` to bootstrap the development environment.  This will:
  - install bundler, if it isn't already installed
  - install the gems specified in the Gemfile & gemspec
  - create two copies of `.env` for your own usage: `.env.development.local` and `.env.test.local`
    - `.env.development.local` is automatically used when you load `irb`
    - `.env.test.local` is automatically used when you run the test suite: `bin/test`
1. Run `bin/test` to run the test suite; make sure all the tests pass

## Using the Client
1. `bin/console` is provided for your convenience.  It will open a ruby console with the WMATA client and your .env preloaded (via `.irbrc`)
1. Make various requests using the public interface, e.g.: `WmataClient::ApiRequest.new.station_schedule(station_code: "E10")`

[wmata-api]:https://developer.wmata.com/