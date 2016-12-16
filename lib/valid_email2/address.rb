require "valid_email2"
require "resolv"
require "mail"

module ValidEmail2
  class Address
    attr_accessor :address

    def initialize(address)
      @parse_error = false
      @raw_address = address

      begin
        @address = Mail::Address.new(address)
      rescue Mail::Field::ParseError
        @parse_error = true
      end
    end

    def valid?
      return false if @parse_error

      if address.domain && address.address == @raw_address
        domain = address.domain
        # Valid address needs to have a dot in the domain
        !!domain.match(/\./) && !domain.match(/\.{2,}/)
      else
        false
      end
    end

    def disposable?
      valid? && domain_is_in?(ValidEmail2.disposable_emails)
    end

    def blacklisted?
      valid? && domain_is_in?(ValidEmail2.blacklist)
    end

    def valid_mx?
      return false unless valid?
      return true if domain_is_in?(ValidEmail2.mx_whitelist)

      mx = []

      Resolv::DNS.open do |dns|
        mx.concat dns.getresources(address.domain, Resolv::DNS::Resource::IN::MX)
      end

      mx.any?
    end

    private

    def domain_is_in?(domain_list)
      # Ensure domain_list is an array
      (domain_list || []).select { |domain|
        address.domain =~ (/^(.*\.)*#{domain}$/i)
      }.any?
    end
  end
end
