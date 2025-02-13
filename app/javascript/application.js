// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import Rails from "rails-ujs";  // Assure-toi que ça importe bien Rails
Rails.start();  // Initialise rails-ujs



