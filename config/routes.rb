Pet::Application.routes.draw do
  resources :projects do
    resources :project_phases
    resources :deliverables
    end
end
#== Route Map
# Generated on 02 Oct 2012 08:59
#
#       projects GET    /projects(.:format)            projects#index
#                POST   /projects(.:format)            projects#create
#    new_project GET    /projects/new(.:format)        projects#new
#   edit_project GET    /projects/:id/edit(.:format)   projects#edit
#        project GET    /projects/:id(.:format)        projects#show
#                PUT    /projects/:id(.:format)        projects#update
#                DELETE /projects/:id(.:format)        projects#destroy
