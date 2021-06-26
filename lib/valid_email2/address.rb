require "valid_email2"
require "resolv"
require "mail"

module ValidEmail2
  class Address
    attr_accessor :address

    PROHIBITED_DOMAIN_CHARACTERS_REGEX = /[+!_\/\s'`]/
    DEFAULT_RECIPIENT_DELIMITER = '+'.freeze
    DOT_DELIMITER = '.'.freeze
    SPECIAL_CHARS = '#\!$%\'*+-/=?^`.{|}~'.freeze

    def self.prohibited_domain_characters_regex
      @prohibited_domain_characters_regex ||= PROHIBITED_DOMAIN_CHARACTERS_REGEX
    end

    def self.prohibited_domain_characters_regex=(val)
      @prohibited_domain_characters_regex = val
    end

    def initialize(address)
      @parse_error = false
      @raw_address = address

      begin
        @address = Mail::Address.new(address)
      rescue Mail::Field::ParseError
        @parse_error = true
      end

      @parse_error ||= address_contain_emoticons? @raw_address
    end

    def valid?
      return @valid unless @valid.nil?
      return false  if @parse_error

      @valid = begin
        if address.domain && address.address == @raw_address
          domain = address.domain

          domain !~ self.class.prohibited_domain_characters_regex &&
            domain.include?('.') &&
            !domain.include?('..') &&
            !domain.start_with?('.') &&
            !domain.start_with?('-') &&
            !domain.include?('-.') &&
            !address.local.include?('..') &&
            !address.local.end_with?('.') &&
            !address.local.start_with?('.')
        else
          false
        end
      end
    end

    def dotted?
      valid? && address.local.include?(DOT_DELIMITER)
    end

    def contain_special_chars?
      valid? && address_contain_special_chars?(address.local, SPECIAL_CHARS)
    end

    def subaddressed?
      valid? && address.local.include?(DEFAULT_RECIPIENT_DELIMITER)
    end

    def disposable?
      disposable_domain? || disposable_mx_server?
    end

    def disposable_domain?
      domain_is_in?(ValidEmail2.disposable_emails)
    end

    def disposable_mx_server?
      valid? && mx_server_is_in?(ValidEmail2.disposable_emails)
    end

    def whitelisted?
      domain_is_in?(ValidEmail2.whitelist)
    end

    def blacklisted?
      valid? && domain_is_in?(ValidEmail2.blacklist)
    end

    def valid_mx?
      return false unless valid?

      mx_or_a_servers.any?
    end

    def valid_strict_mx?
      return false unless valid?

      mx_servers.any?
    end

    private

    def domain_is_in?(domain_list)
      address_domain = address.domain.downcase
      return true if domain_list.include?(address_domain)

      i = address_domain.index('.')
      return false unless i

      return domain_list.include?(address_domain[(i+1)..-1])
    end

    def mx_server_is_in?(domain_list)
      mx_servers.any? { |mx_server|
        return false unless mx_server.respond_to?(:exchange)
        mx_server = mx_server.exchange.to_s

        domain_list.any? { |domain|
          mx_server.end_with?(domain) && mx_server =~ /\A(?:.+\.)*?#{domain}\z/
        }
      }
    end

    def address_contain_emoticons?(email)
      return false if email.nil?

      email.each_char.any? { |char| char.bytesize > 1 }
    end

    def address_contain_special_chars?(address, special_chars)
      special_chars.chars.any? { |char| address.include?(char) }
    end

    def mx_servers
      @mx_servers ||= Resolv::DNS.open do |dns|
        dns.getresources(address.domain, Resolv::DNS::Resource::IN::MX)
      end
    end

    def mx_or_a_servers
      @mx_or_a_servers ||= Resolv::DNS.open do |dns|
        (mx_servers.any? && mx_servers) ||
          dns.getresources(address.domain, Resolv::DNS::Resource::IN::A)
      end
    end
  end
end
