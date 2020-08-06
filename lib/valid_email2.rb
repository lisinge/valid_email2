# frozen_string_literal: true

require "valid_email2/email_validator"

module ValidEmail2
  blocklist_FILE  = "config/blocklisted_email_domains.yml"
  allowlist_FILE  = "config/allowlisted_email_domains.yml"
  DISPOSABLE_FILE = File.expand_path('../config/disposable_email_domains.txt', __dir__)

  def self.disposable_emails
    @disposable_emails ||= File.open(DISPOSABLE_FILE){ |f| f.read }.split("\n")
  end

  def self.blocklist
    @blocklist ||= if File.exist?(blocklist_FILE)
                     YAML.load_file(File.expand_path(blocklist_FILE))
                   else
                     []
                   end
  end

  def self.allowlist
    @allowlist ||= if File.exist?(allowlist_FILE)
                     YAML.load_file(File.expand_path(allowlist_FILE))
                   else
                     []
                   end
  end
end
