xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do

   xml.title       "jCMS - juntaDados Content Managament System"
   xml.link        url_for :only_path => false, :controller => 'texts'
   xml.description "juntaDados Content Managament System"

   @texts.each do |text|
     xml.item do
       xml.title       text.title
       xml.link        url_for :only_path => false, :controller => 'texts', :action => 'show', :id => text.id
       xml.description text.abstract
       xml.guid        url_for :only_path => false, :controller => 'texts', :action => 'show', :id => text.id
     end
   end

 end
end
