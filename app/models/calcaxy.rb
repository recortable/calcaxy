# calcaxy helper object

class Calcaxy
  MIN_YEAR = 1990
  MAX_YEAR = 2008
  PAGE_HOME = 1
  PAGE_BOOC = 2
  PAGE_BIO = 216
  PAGE_TXT = 20

  def self.home
    Page.find(1)
  end

  def self.metas
    Page.find(1).metas(:order => 'id')
  end

  def self.valid_year?(string)
    year = string.to_i
    year < MIN_YEAR || year > MAX_YEAR
  end

  def self.booc_parent(year)
    Page.find_by_title(year, :conditions => ['parent_id = ?', PAGE_BOOC])
  end

  def self.booc_years
    years = (MIN_YEAR..MAX_YEAR).to_a.reverse!
    years.delete(2006)
    years
  end

  
end