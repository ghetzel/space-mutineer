#!/usr/bin/env ruby
require 'yaml'

vocabulary = YAML.load(File.read('vocabulary.yml'))

(ARGV[0] || 1).to_i.times do
  first = vocabulary['names']['first'].sample.capitalize
  last = (
    (
      (vocabulary['names']['last1']+vocabulary['names']['lastPre1']).product(
        vocabulary['names']['last1']+vocabulary['names']['lastPost1']
      ).collect{|i|
        i.join
      }
    ) + vocabulary['names']['last2']).sample.split(' ').map(&:capitalize).join(' ')

  puts "#{first} #{last}"
end