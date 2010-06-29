# To change this template, choose Tools | Templates
# and open the template in the editor.

class CalcaxyController < ApplicationController
  layout 'xy'
  #caches_page :home, :booc, :files

  MIN_YEAR = 1990
  MAX_YEAR = 2008
  PAGE_HOME = 1
  PAGE_BOOC = 2
  PAGE_BIO = 216
  PAGE_TXT = 209


  before_filter :load_calc
	
  def index
    redirect_to :action => 'home'
  end

  def homeology
    home = Calcaxy.home
    @attachments = Attachment.find(:all, :conditions => {:page_id => home.id}, :order => 'id DESC')
  end

  def home
    if params[:cword]
      @calc = "c#{params[:cword]} a#{params[:aword]} l#{params[:lword]} c#{params[:ccword]}"
      Meta.new(:page_id => 1, :name => 'calc', :value => @calc).save
      redirect_to :action => 'home'
    end
    @home = Calcaxy.home
    @metas = Calcaxy.metas
    @updates = Updates.new
  end

  def booc
    if Calcaxy.valid_year? params[:year]
      redirect_to :action => 'booc', :year => '2008'
    else
       @year = params[:year].to_i
       @years = Calcaxy.booc_years
       @parent = Calcaxy.booc_parent(@year)
       @boocs = @parent.rev_children
    end
  end

  def booc_response
    if params[:name].empty?
      page = Page.find(params[:id])
      comment = Page.new(params[:response])
      comment.mime = 'response'
      comment.parent_id = page.id
      comment.save
      redirect_to :back
    else
      render :text => "please, do not spam us!, #{params[:name]}"
    end
  end
  
  def works
    @files = Page.find_all_by_mime('file', :order => 'position')
    if params[:show]
      file = Page.find_by_id(params[:show])
      @show = file.attachment(:main).public_filename
    end
  end

  def cell
    render :action => 'home'
  end
  
  def biobiblio
    menu(PAGE_BIO)
  end

  def txts
    menu(PAGE_TXT)
  end

  def front
    @images = Attachment.find(:all, :conditions => {:width => '683', :height => '304'},
      :order => 'created_at DESC')
  end

  private
  def menu(root_id)
    id = params[:id]
    @menu = Page.find(root_id).children
    if (id == nil)
      redirect_to  :id => @menu.first.id
    else
      @page = Page.find(id)
      if @page.parent_id != root_id
        redirect_to :id => @menu.first.id
      else
        render :action => 'txts'
      end
    end
  end

  def load_calc
    @calc =Meta.find(:last, :conditions => ["page_id = ?", 1]).value
  end
end
