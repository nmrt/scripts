##!/usr/bin/ruby -w

require 'rubygems'
require 'transmission-client'

EventMachine.run do
  t = Transmission::Client.new
  EM.add_periodic_timer(1) do
    t.torrents do |torrents|
      torrents.each do |tor|
        puts tor.percentDone
      end
    end
  end
end

