require_relative 'app'

def main
  app = App.new
  app.welcome
  app.run
end

main
