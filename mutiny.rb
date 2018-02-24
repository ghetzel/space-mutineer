#!/usr/bin/env ruby
if [].respond_to?(:choice)
  class Array
    def sample
      choice()
    end
  end
end

require 'yaml'

vocabulary = YAML.load(File.read('vocabulary.yml'))

# I mean, this is an almost pathological example of bad code...
#   - Future Gary I, who regrets this approach.
#
(ARGV[0] || 1).to_i.times do
  first = vocabulary['names']['first'].sample.capitalize
  last = (
    (
      (vocabulary['names']['last1']+vocabulary['names']['lastPre1']).product(
        vocabulary['names']['last1']+vocabulary['names']['lastPost1']
      ).collect{|i|
        i.join
      }.reject{|i|
        i.downcase[0..(i.length/2)-1] == i.downcase[(i.length/2)..-1]
      }
    ) + vocabulary['names']['last2']).sample.split(' ').map(&:capitalize).join(' ')

  puts "#{first} #{last}"
end
