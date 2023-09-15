require 'csv'

class HomeController < ApplicationController
  def index



      image_filename = "default.png"  # Replace with the actual image filename

      # Construct the path to the image in the assets directory
      assets_pathj = Rails.root.join('app', 'assets', 'images','icons' ,"default.jpg")
      assets_pathp = Rails.root.join('app', 'assets', 'images','icons' ,"default.png")

      # Check if the file exists
      if File.exist?(assets_pathj)
        puts "Image exists!jjjjjjjjjjjjjj"
      elsif File.exist?(assets_pathp)  
        puts "Image exists!pppppppppppppp"
      else
        puts "Image does not exist."
      end

   
    
    binding.pry
    
    # puts salary_ranges




  end
end
