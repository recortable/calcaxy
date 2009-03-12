ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'calcaxy'
  map.connect '/ver/:id', :controller => 'calcaxy', :action => 'pagina'
  map.connect '/booc/:year', :controller => 'calcaxy', :action => 'booc'
  map.connect '/txts/:id', :controller => 'calcaxy', :action => 'txts'
  map.connect '/biobiblio/:id', :controller => 'calcaxy', :action => 'biobiblio'
  map.connect ':action', :controller => 'calcaxy'

  #  map.connect ':controller/:action/:id'
  #  map.connect ':controller/:action/:id.:format'
end
