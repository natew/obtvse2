INFO = YAML::load(ERB.new(IO.read(File.join(Obtvse::Engine.root, 'config', 'info.yml'))).result)
