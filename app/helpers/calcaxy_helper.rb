
module CalcaxyHelper

   def as_calc(text)
     text.gsub(/\s([calc])/, ' <strong>\1</strong>').sub(/c/, "<strong>c</strong>")
   end

  def thumb_of(page, name)
    if page.attachment name
      image = image_tag page.attachment(name).public_filename, :size => "193x117"
      if page.attachment(:main)
        link_to_function image, "show_image('#{page.attachment(:main).public_filename}');"
      else
        image
      end
    end
  end
end