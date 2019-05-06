module Xzh
  require 'singleton'

  # This is config model
  class ConfigYAML
    attr_accessor :gitlab_host, :gitlab_private_token

    # parse ~/.xzh.yaml config file
    def load_cfg
      map = YAML.safe_load(File.open(yaml_path, 'w+'))
      @gitlab_host = map['gitlab_host']
      @gitlab_private_token = map['gitlab_private_token']
    end

    def store_cfg
      map = {}
      instance_variables.each do |var|
        map[var.to_s.delete("@")] = instance_variable_get(var)
      end
      File.open(yaml_path, 'w+') { |f| f.write(map.to_yaml) }
    end

    def yaml_path
      "/Users/#{`whoami`.chomp}/.xzh.yaml"
    end
  end
end