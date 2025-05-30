require "bundler"
require "dotenv"
Bundler.require :development, :test

require "wmata_client"
require "minitest/autorun"
require "minitest/spec"
require "minitest/stub_const"
require "mocha/minitest"

Dotenv.load(".env.test.local", ".env.test", ".env.local", ".env")

Bundler.setup(:default, :test)
