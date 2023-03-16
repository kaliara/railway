Passwordless.default_from_address = "Elyse and Matthew <matthew@kaliara.com>"
Passwordless.token_generator = -> (session) {
  [SecureRandom.base58(7), Date.today.yday].join
}
Passwordless.expires_at = lambda { 1.year.from_now }
Passwordless.timeout_at = lambda { 1.year.from_now }

Passwordless.failure_redirect_path = '/error'
Passwordless.success_redirect_path = '/reservation/edit'