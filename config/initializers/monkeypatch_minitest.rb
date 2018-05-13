# https://github.com/rails/rails/issues/31324
if ActionPack::VERSION::STRING >= "5.2.0"
  Minitest::Rails::TestUnit = Rails::TestUnit
end
