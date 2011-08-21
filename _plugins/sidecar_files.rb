require 'pathname'

module Jekyll
  
  # Monkey-patch an accessor for a post to check for sidecar files
  # This returns a dictionary of sidecar files keyed by their extension
  class Post
    def sidecar_files(exts)
      path = File.join(@base,@name)
      basename = path.chomp(File.extname(path))
      valid_exts = {}
      exts.each do |ext|
        extpath = basename + "." + ext
        if File.exist?(extpath)
          valid_exts[ext] = extpath
        end
      end
      valid_exts
    end    
  end

  # Sub-class Jekyll::StaticFile to allow recovery from unimportant exception 
  # when writing the sidecar file.
  class StaticSidecarFile < StaticFile
    def initialize(site, base, dir, name, filedest)
      super(site,base,dir,name)
      @filedest = filedest
    end
   
    def destination(dest)
      File.join(dest, @filedest)
    end
  end

  class SidecarFileGenerator < Generator
    safe true
    priority :low
    
    def generate(site)
      # make sure there is something to do
      return unless site.config.has_key?('sidecar_exts')
      return unless !site.posts.empty?
      
      # Create the destination folder if necessary.
      site_folder = site.config['destination']
      unless File.directory?(site_folder)
        p = Pathname.new(site_folder)
        p.mkdir
      end
      
      # Get the list of sidecar extensions
      exts = site.config['sidecar_exts']

      site.posts.each{ |post|
        sidecars = post.sidecar_files(exts)
        destpath = post.destination('')  
        basename = File.basename(destpath, File.extname(destpath))
        dir = File.dirname(destpath)
        sidecars.each do |ext, path|
          newfile = basename + '.' + ext
          
          site.static_files << StaticSidecarFile.new(site, '', 
            File.dirname(path), File.basename(path), File.join(dir,newfile))
        end
      }
    end
  end
end
