Lookbook::Engine.routes.draw do
  if Lookbook::Engine.websocket.mountable?
    mount Lookbook::Engine.websocket.server => "/cable", :as => :cable
  end

  root to: "application#index", as: :lookbook_home

  get "/#{Lookbook.config.page_route}", to: "pages#index", as: :lookbook_page_index
  get "/#{Lookbook.config.page_route}/*path", to: "pages#show", as: :lookbook_page

  get "/previews", to: "previews#index", as: :lookbook_previews
  get "/preview/*path", to: "previews#show", as: :lookbook_preview
  get "/inspect/*path", to: "inspector#show", as: :lookbook_inspect

  get "/*path", to: "inspector#show_legacy", as: :lookbook_inspect_legacy
end
