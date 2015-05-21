# System specific commanfs 
module SysUtils
  
  class << self
    def open(command)
      if system("xdg-open #{command}")
        true
      else
        open_is_present = system('command -v open >/dev/null 2>&1')
        if open_is_present
          system("open #{command}") 
        else
          false
        end
      end
    end
  end  
end