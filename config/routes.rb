# == Route Map
#
#                                      Prefix Verb   URI Pattern                                                                                       Controller#Action
#                                    rswag_ui        /api-docs                                                                                         Rswag::Ui::Engine
#                                   rswag_api        /api-docs                                                                                         Rswag::Api::Engine
#                 mark_overdue_api_v1_borrows POST   /api/v1/borrows/mark_overdue(.:format)                                                            api/v1/borrows#mark_overdue
#                  return_book_api_v1_borrows POST   /api/v1/borrows/return_book(.:format)                                                             api/v1/borrows#return_book
#                mark_returned_api_v1_borrows POST   /api/v1/borrows/mark_returned(.:format)                                                           api/v1/borrows#mark_returned
#                              api_v1_borrows GET    /api/v1/borrows(.:format)                                                                         api/v1/borrows#index
#                                             POST   /api/v1/borrows(.:format)                                                                         api/v1/borrows#create
#                               api_v1_borrow GET    /api/v1/borrows/:id(.:format)                                                                     api/v1/borrows#show
#                                             PATCH  /api/v1/borrows/:id(.:format)                                                                     api/v1/borrows#update
#                                             PUT    /api/v1/borrows/:id(.:format)                                                                     api/v1/borrows#update
#                                             DELETE /api/v1/borrows/:id(.:format)                                                                     api/v1/borrows#destroy
#                     new_api_v1_user_session GET    /api/v1/users/sign_in(.:format)                                                                   api/v1/sessions#new
#                         api_v1_user_session POST   /api/v1/users/sign_in(.:format)                                                                   api/v1/sessions#create
#                 destroy_api_v1_user_session DELETE /api/v1/users/sign_out(.:format)                                                                  api/v1/sessions#destroy
#                    new_api_v1_user_password GET    /api/v1/users/password/new(.:format)                                                              api/v1/passwords#new
#                   edit_api_v1_user_password GET    /api/v1/users/password/edit(.:format)                                                             api/v1/passwords#edit
#                        api_v1_user_password PATCH  /api/v1/users/password(.:format)                                                                  api/v1/passwords#update
#                                             PUT    /api/v1/users/password(.:format)                                                                  api/v1/passwords#update
#                                             POST   /api/v1/users/password(.:format)                                                                  api/v1/passwords#create
#             cancel_api_v1_user_registration GET    /api/v1/users/cancel(.:format)                                                                    api/v1/registrations#cancel
#                new_api_v1_user_registration GET    /api/v1/users/sign_up(.:format)                                                                   api/v1/registrations#new
#               edit_api_v1_user_registration GET    /api/v1/users/edit(.:format)                                                                      api/v1/registrations#edit
#                    api_v1_user_registration PATCH  /api/v1/users(.:format)                                                                           api/v1/registrations#update
#                                             PUT    /api/v1/users(.:format)                                                                           api/v1/registrations#update
#                                             DELETE /api/v1/users(.:format)                                                                           api/v1/registrations#destroy
#                                             POST   /api/v1/users(.:format)                                                                           api/v1/registrations#create
#                   revoke_api_v1_user_tokens POST   /api/v1/users/tokens/revoke(.:format)                                                             devise/api/tokens#revoke
#                  refresh_api_v1_user_tokens POST   /api/v1/users/tokens/refresh(.:format)                                                            devise/api/tokens#refresh
#                  sign_up_api_v1_user_tokens POST   /api/v1/users/tokens/sign_up(.:format)                                                            devise/api/tokens#sign_up
#                  sign_in_api_v1_user_tokens POST   /api/v1/users/tokens/sign_in(.:format)                                                            devise/api/tokens#sign_in
#                     info_api_v1_user_tokens GET    /api/v1/users/tokens/info(.:format)                                                               devise/api/tokens#info
#                                api_v1_books GET    /api/v1/books(.:format)                                                                           api/v1/books#index
#                                             POST   /api/v1/books(.:format)                                                                           api/v1/books#create
#                                 api_v1_book GET    /api/v1/books/:id(.:format)                                                                       api/v1/books#show
#                                             PATCH  /api/v1/books/:id(.:format)                                                                       api/v1/books#update
#                                             PUT    /api/v1/books/:id(.:format)                                                                       api/v1/books#update
#                                             DELETE /api/v1/books/:id(.:format)                                                                       api/v1/books#destroy
#          total_books_api_v1_dashboard_index GET    /api/v1/dashboard/total_books(.:format)                                                           api/v1/dashboard#total_books
# total_borrowed_books_api_v1_dashboard_index GET    /api/v1/dashboard/total_borrowed_books(.:format)                                                  api/v1/dashboard#total_borrowed_books
#       borrowed_books_api_v1_dashboard_index GET    /api/v1/dashboard/borrowed_books(.:format)                                                        api/v1/dashboard#borrowed_books
#      due_today_books_api_v1_dashboard_index GET    /api/v1/dashboard/due_today_books(.:format)                                                       api/v1/dashboard#due_today_books
#        overdue_books_api_v1_dashboard_index GET    /api/v1/dashboard/overdue_books(.:format)                                                         api/v1/dashboard#overdue_books
#                      api_v1_dashboard_index GET    /api/v1/dashboard(.:format)                                                                       api/v1/dashboard#index
#                                             POST   /api/v1/dashboard(.:format)                                                                       api/v1/dashboard#create
#                            api_v1_dashboard GET    /api/v1/dashboard/:id(.:format)                                                                   api/v1/dashboard#show
#                                             PATCH  /api/v1/dashboard/:id(.:format)                                                                   api/v1/dashboard#update
#                                             PUT    /api/v1/dashboard/:id(.:format)                                                                   api/v1/dashboard#update
#                                             DELETE /api/v1/dashboard/:id(.:format)                                                                   api/v1/dashboard#destroy
#                          rails_health_check GET    /up(.:format)                                                                                     rails/health#show
#            turbo_recede_historical_location GET    /recede_historical_location(.:format)                                                             turbo/native/navigation#recede
#            turbo_resume_historical_location GET    /resume_historical_location(.:format)                                                             turbo/native/navigation#resume
#           turbo_refresh_historical_location GET    /refresh_historical_location(.:format)                                                            turbo/native/navigation#refresh
#               rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#                  rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#               rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#         rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#               rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#                rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#              rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                             POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#           new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#               rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#    new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#       rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#       rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
#    rails_conductor_inbound_email_incinerate POST   /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
#                          rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                    rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                             GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                   rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#             rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                             GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                          rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                   update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                        rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create
#
# Routes for Rswag::Ui::Engine:
#
#
# Routes for Rswag::Api::Engine:

Rails.application.routes.draw do
  apipie
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :borrows do
        post 'mark_overdue', on: :collection
        post 'return_book', on: :collection
        post 'mark_returned', on: :collection
      end
      devise_for :users
      resources :books
      resources :dashboard do
        get 'total_books', on: :collection
        get 'total_borrowed_books', on: :collection
        get 'borrowed_books', on: :collection
        get 'due_today_books', on: :collection
        get 'overdue_books', on: :collection
      end
    end  
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
