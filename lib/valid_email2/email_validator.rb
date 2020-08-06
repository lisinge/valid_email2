require "valid_email2/address"
require "active_model"
require "active_model/validations"

module ValidEmail2
  class EmailValidator < ActiveModel::EachValidator
    def default_options
      { regex: true, disposable: false, mx: false, disallow_subaddressing: false }
    end

    def validate_each(record, attribute, value)
      return unless value.present?
      options = default_options.merge(self.options)

      address = ValidEmail2::Address.new(value)

      error(record, attribute) && return unless address.valid?

      if options[:disallow_dotted]
        error(record, attribute) && return if address.dotted?
      end

      if options[:disallow_subaddressing]
        error(record, attribute) && return if address.subaddressed?
      end

      if options[:disposable]
        error(record, attribute) && return if address.disposable?
      end

      if options[:disposable_domain]
        error(record, attribute) && return if address.disposable_domain?
      end

      if options[:disposable_with_allowlist]
        error(record, attribute) && return if address.disposable? && !address.allowlisted?
      end

      if options[:blocklist]
        error(record, attribute) && return if address.blocklisted?
      end

      if options[:mx]
        error(record, attribute) && return unless address.valid_mx?
      end
    end

    def error(record, attribute)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
