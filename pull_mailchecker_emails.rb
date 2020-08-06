#!/usr/bin/env ruby

require "yaml"

require "json"
require "net/http"

allowlisted_emails = %w(
  onet.pl poczta.onet.pl fastmail.fm hushmail.com
  hush.ai hush.com hushmail.me naver.com qq.com example.com
  yandex.net gmx.com gmx.es
)

existing_emails = File.open("config/disposable_email_domains.txt") { |f| f.read.split("\n") }

url = "https://raw.githubusercontent.com/FGRibreau/mailchecker/master/list.txt"
resp = Net::HTTP.get_response(URI.parse(url))

remote_emails = resp.body.split("\n").flatten - allowlisted_emails

result_emails = (existing_emails + remote_emails).map(&:strip).uniq.sort

File.open("config/disposable_email_domains.txt", "w") {|f| f.write result_emails.join("\n") }
