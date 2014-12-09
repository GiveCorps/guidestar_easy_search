require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'hashie'
require 'guidestar'
require "guidestar_easy_search/version"
require "guidestar_easy_search/search"
require "guidestar_easy_search/response"
require "guidestar_easy_search/error"

module GuidestarEasySearch
end

class Hash
  def reverse_merge!(other_hash)
    merge!( other_hash ){|key,left,right| left }
  end
end
