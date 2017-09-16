require 'mechanize'
require 'open-uri'
require 'nokogiri'
require 'kconv'
require 'csv'

class Scraping
      def self.mercari_large
        agent = Mechanize.new
        current_page = agent.get("https://www.mercari.com/jp/category/")
        elements = current_page.search('.category-list-nav a')
        elements.each do |ele|
          name = ele.inner_text
          name.strip!
          category_large = Category.new(name: name)
          category_large.save
        end
      end

    #   def self.mercari_middle
    #     agent = Mechanize.new
    #     current_page = agent.get("https://www.mercari.com/jp/category/")
    #     elements = current_page.search('.category-list-individual-box-sub-category-name h4')
    #     elements.each do |ele|
    #       name = ele.inner_text
    #       name.strip!
    #       category_middle = Category.new(name: name)
    #       category_middle.save
    #     end
    #    end

    #   def self.mercari_small
    #     agent = Mechanize.new
    #     current_page = agent.get("https://www.mercari.com/jp/category/")
    #     elements = current_page.search('.category-list-individual-box-sub-sub-category-name a')
    #     elements.each do |ele|
    #       name = ele.inner_text
    #       name.strip!
    #       category_small = Category.new(name: name)
    #       category_small.save
    #     end
    #   end

    # def self.mercari_urls
    #    links = []
    #    agent = Mechanize.new
    #    current_page = agent.get("https://www.mercari.com/jp/brand/")
    #    elements = current_page.search('.brand-group-link-box a')
    #    elements.each do |ele|
    #     links << ele.get_attribute('href')
    #    end
    #    links.each_with_index do |link, i|
    #     url = ('https://www.mercari.com' + link)
    #     category_id = i + 1
    #     Scraping.mercari_brands(url, category_id)
    #   end
    # end

    # def self.mercari_brands(link, category_id)
    #   agent = Mechanize.new
    #   page = agent.get(link)
    #   elements = page.search('.brand-list-initial-box-brand-name p')
    #   elements.each do |ele|
    #     brand_name = ele.inner_text
    #     brand_name.strip!
    #     brand = Brand.new(name: brand_name, category_large_id: category_id)
    #     brand.save
    #   end
    # end


end
