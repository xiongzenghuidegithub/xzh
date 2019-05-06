module Xzh
  module Helper
    require 'pathname'
    require 'FileUtils'
    require 'json'

    class FileHelper
      # /path/main.c ==> main.c
      #
      def file_name(file_path)
        File.basename(file_path)
      end

      def file_path(file_name, dir_name)
        dir_name ||= __dir__
        return File.expand_path(file_name, dir_name)
      end

      def file_paths_in_dir(dir_path, file_type)
        files = Dir.glob(dir_path)
      end

      # /path/main.c ==> main
      #
      def file_name_exclue_ext(file_path)
        File.basename(file_path, file_type(file_path))
      end

      def file_type(file_path)
        File.extname(file_path)
      end

      # [/path1/main.c, /path2/main.cpp, /path3/main.m, /path1/tool.c] ==> [.c, .cpp, .m]
      def file_types(file_paths)
        types = file_paths.map do |file_path|
          File.extname(file_path)
        end
        types.uniq!
        types
      end

      def copy_files(src_dir, dest_dir)
        Dir.mkdir(dest_dir) unless File.exist?(dest_dir)
        FileUtils.cp_r(src_dir, dest_dir)
      end

      def user_desktop(dir_name)
        path = "/Users/#{`whoami`.chomp}/Desktop/#{dir_name}"
        remove_dir(path) if File.exist?(path)
        Dir.mkdir(path)
      end

      def remove_dir(dir)
        return unless File.exist?(dir)

        if File.directory?(dir)
          Dir.foreach(dir) do |sub_file|
            if sub_file != '.' && sub_file != '..'
              remove_dir(File.join(dir, sub_file))
            end
          end
          Dir.rmdir(dir)
        else
          File.delete(dir)
        end
      end

      def write_hash(hash, file_path, mode = 'w+')
        File.open(file_path, mode) do |f|
          f.write(JSON.pretty_generate(hash))
        end
      end
    end
  end
end