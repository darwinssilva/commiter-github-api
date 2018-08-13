require_relative '../lib/exec'

Exec.new("Dinda-com-br", "braspag-rest", ["name", "email", "login", "avatar_url", "contributions"]).execute