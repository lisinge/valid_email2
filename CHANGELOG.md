## Version 3.2.5
* Remove false positives
* Pull new domains

## Version 3.2.4
* Remove false positives

## Version 3.2.3
* Disallow backtick (\`) in domain
* https://github.com/micke/valid_email2/pull/152
* https://github.com/micke/valid_email2/pull/151

## Version 3.2.2
* Disallow quote (') in domain

## Version 3.2.1
* Fix loading of blocklisted domains

## Version 3.2.0
* Add option to disallow dotted email addresses https://github.com/micke/valid_email2/pull/146
* Update list of disposable email domains with another 18,327 domains
* Switch to storing the disposable domains as a TXT file instead of YAML
  Loading it from a YAML file takes 50x longer and uses 9x the amount of RAM. (https://gist.github.com/micke/9ff549865863aa7251657f7b5a0235aa)

## Version 3.1.3
* Disallow `/` in addresses https://github.com/micke/valid_email2/pull/142
* Add option to only validate that domain is not in list of disposable emails https://github.com/micke/valid_email2/pull/141

## Version 3.1.2
* Disallow ` ` in addresses https://github.com/micke/valid_email2/pull/139

## Version 3.1.1
* Disallow domains starting or ending with `-` https://github.com/micke/valid_email2/pull/140

## Version 3.1.0
* Performance improvements https://github.com/micke/valid_email2/pull/137

## Version 3.0.5
* Addresses with a dot before the @ is not valid https://github.com/micke/valid_email2/pull/136

## Version 3.0.4
* https://github.com/micke/valid_email2/pull/133

## Version 3.0.3
* Remove .id.au from the list https://github.com/micke/valid_email2/issues/131

## Version 3.0.2
* Add displaosable email providers https://github.com/micke/valid_email2/pull/127 https://github.com/micke/valid_email2/pull/128 https://github.com/micke/valid_email2/pull/132
* Refine documentation https://github.com/micke/valid_email2/pull/130

## Version 3.0.1
Relax the restrictions on domain validation so that we allow unicode domains and
other non ASCII domains while still disallowing the domains we blocked before.

## Version 3.0.0
* Moved __and__ renamed blocklist and allowlist and disposable_emails. Moved from the vendor directory to
  the config directory.  
  `vendor/blocklist.yml` -> `config/blocklisted_email_domains.yml`  
  `vendor/allowlist.yml` -> `config/allowlisted_email_domains.yml`  
  `vendor/disposable_emails.yml` -> `config/disposable_email_domains.yml`

* Test if the MX server that a domain resolves to is present in the lists of
  disposable email domains. As suggested in issue [#95](https://github.com/micke/valid_email2/issues/95)

* Update disposable emails

## Version 2.3.1
Update disposable emails (https://github.com/micke/valid_email2/pull/122)

## Version 2.3.0
Add allowlist feature (https://github.com/lisinge/valid_email2/pull/119)  
Update disposable emails (https://github.com/lisinge/valid_email2/pull/116)

## Version 2.2.3
Update disposable emails #113
Remove false positives (yandex.com, naver.com, com.ar)

## Version 2.2.2
Remove false-positive 163.com (https://github.com/lisinge/valid_email2/issues/105)

## Version 2.2.1
Fix regression where `ValidEmail2::Address.new` couldn't handle the address
being nil (https://github.com/lisinge/valid_email2/issues/102)

## Version 2.2.0
Removed backwards-compatability shim  (https://github.com/lisinge/valid_email2/pull/79)  
Removed protonmail.com from disposable email domains (https://github.com/lisinge/valid_email2/pull/99)  
Update disposable email domains (https://github.com/lisinge/valid_email2/pull/100)  
Allow case of MX record fallback to A record (https://github.com/lisinge/valid_email2/pull/101)

## Version 2.1.2
Removed qq.com from disposable email domains

## Version 2.1.1
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/92)  
Removed false positive domains

## Version 2.1.0
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/85)  
Validate that the domain includes only allowed characters (https://github.com/lisinge/valid_email2/issues/88)

## Version 2.0.2
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/85)

## Version 2.0.1
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/82 and https://github.com/lisinge/valid_email2/pull/83)

## Version 2.0.0
Add validator namespaced under `ValidEmail2` https://github.com/lisinge/valid_email2/pull/79  
Deprecate global `EmailValidator` in favor of the namespaced one.

## Version 1.2.22
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/80)

## Version 1.2.21
Added More disposable email domains (https://github.com/lisinge/valid_email2/pull/77, https://github.com/lisinge/valid_email2/pull/78)

## Version 1.2.20
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/76)

## Version 1.2.19
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/73, https://github.com/lisinge/valid_email2/pull/74 and https://github.com/lisinge/valid_email2/pull/75)

## Version 1.2.18
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/70, https://github.com/lisinge/valid_email2/pull/71 and https://github.com/lisinge/valid_email2/pull/72)

## Version 1.2.17
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/70)

## Version 1.2.16
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/68, https://github.com/lisinge/valid_email2/pull/69 and https://github.com/lisinge/valid_email2/commit/2e512458c181eb4d95514320723a09781fb14485)

## Version 1.2.15
Removed disposable domains that are false positives (https://github.com/lisinge/valid_email2/pull/67)

## Version 1.2.14
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/66)

## Version 1.2.13
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/65)

## Version 1.2.12
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/64)

## Version 1.2.11
Properly test that domain is a proper domain and not just a TLD (https://github.com/lisinge/valid_email2/issues/63)

## Version 1.2.10
Improve performance in domain matching (https://github.com/lisinge/valid_email2/pull/62)
Add clipmail.eu (https://github.com/lisinge/valid_email2/pull/61)

## Version 1.2.9
Remove example.com (https://github.com/lisinge/valid_email2/issues/59)

## Version 1.2.8
Add maileme101.com (https://github.com/lisinge/valid_email2/pull/56)

## Version 1.2.7
Add throwam.com and pull updates from mailchecker.

## Version 1.2.6
Remove nus.edu.sg as it's a valid domain (https://github.com/lisinge/valid_email2/pull/54)

## Version 1.2.5
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/51, https://github.com/lisinge/valid_email2/pull/52 and https://github.com/lisinge/valid_email2/pull/53)

## Version 1.2.4
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/48, https://github.com/lisinge/valid_email2/pull/49 and https://github.com/lisinge/valid_email2/pull/50)

## Version 1.2.3
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/45)

## Version 1.2.2
Removed false positive email domains (https://github.com/lisinge/valid_email2/pull/43 and https://github.com/lisinge/valid_email2/pull/44)

## Version 1.2.1
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/41, https://github.com/lisinge/valid_email2/pull/42 and https://github.com/lisinge/valid_email2/commit/8b99a799dc126229d9bc4d79d473a0344e788d34)

## Version 1.2.0
Disposable email providers have started to use random subdomains so valid_email2
will now correctly match against subdomains https://github.com/lisinge/valid_email2/issues/40  
Updated list of disposable email providers.

## Version 1.1.13
Removed husmail.com and nevar.com from the disposable email list (https://github.com/lisinge/valid_email2/pull/38)

## Version 1.1.12
Removed fastmail.fm from the disposable email list (https://github.com/lisinge/valid_email2/pull/37)

## Version 1.1.11
Removed poczta.onet.pl from the disposable_emails list (https://github.com/lisinge/valid_email2/issues/34)
Added a allowlist to the internal pull_mailchecker_emails so that poczta.onet.pl
can't sneak back in again.

## Version 1.1.10
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/32)
Added script that pulls disposable emails (https://github.com/lisinge/valid_email2/pull/33)

## Version 1.1.9
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/22,
https://github.com/lisinge/valid_email2/pull/23, https://github.com/lisinge/valid_email2/pull/24,
https://github.com/lisinge/valid_email2/pull/25, https://github.com/lisinge/valid_email2/pull/26,
https://github.com/lisinge/valid_email2/pull/27, https://github.com/lisinge/valid_email2/pull/29
and https://github.com/lisinge/valid_email2/pull/30)

## Version 1.1.8
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/21)

## Version 1.1.7
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/18 and https://github.com/lisinge/valid_email2/pull/19)

## Version 1.1.6
Fix a regression which changed validation on domains that caused domains with
multiple consecutive dots to be valid.

## Version 1.1.5
Be more lenient on the mail gem version dependency to allow people to use v2.6.
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/14 and https://github.com/lisinge/valid_email2/pull/15)

## Version 1.1.4
Added more disposable email domains (https://github.com/lisinge/valid_email2/commit/aedb51fadd5a05461d7f5ef7ea6942d7769f0c58)

## Version 1.1.3
Added more disposable email domains (https://github.com/lisinge/valid_email2/commit/a29ce30d4bc22a23283a0b3f9f6d4560309784ca)

## Version 1.1.2
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/11 and https://github.com/lisinge/valid_email2/pull/13 and https://github.com/lisinge/valid_email2/commit/81e20eb8a14759b88dfee3c343e21512aa7d8da4)

## Version 1.1.1
Added more disposable email domains (https://github.com/lisinge/valid_email2/pull/9 and https://github.com/lisinge/valid_email2/pull/10)

## Version 1.1.0
Added support to locally blocklist emails

## Version 1.0.0

Moved EmailValidator to seperate file
