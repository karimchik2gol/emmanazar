# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( app.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( datatable.js datatable.css graphic.css graphic.js)

Rails.application.config.assets.paths << Rails.root.join("app", "assets", "plugins")
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "pages")
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "fonts")
Rails.application.config.assets.precompile += %w( .svg .eot .woff .ttf )