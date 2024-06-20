# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap
pin "application"#, preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# chart.js has import of ../_/6La3kzg5.js file
# so to make it work from 'vendor' folder, the folder '_' was added.
# file _/6La3kzg5.js was saved there. (origin: "https://ga.jspm.io/npm:chart.js@4.4.3/_/6La3kzg5.js")
pin "chart.js" # @4.4.3
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.2
