
class Updates

  def initialize
    @pages = Page.find(:all, :order => 'created_at DESC', :limit => 3)
  end

  def each(&block)
    @pages.each do |page|
      update = {}
      if page.mime == 'booc'
        update[:title] = "#{fecha page} - BOOC #{page.title}"
        update[:path] = "booc/#{year page}#booc#{page.id}"
      elsif page.mime == 'file'
        update[:title] = "#{fecha page} - FILES"
        update[:path] = "works?show=#{page.id}"
      else
        update[:title] = "#{page.title}"
        update[:path] = '#'
      end
      yield update
    end
  end

  private
  def fecha(page)
    page.updated_at.strftime("%Y/%m/%d")
  end

  def year(page)
    page.updated_at.year
  end
end