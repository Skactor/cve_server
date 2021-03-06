require 'cve_server/config'

module CVEServer
  module Helper
    module_function

    def valid_cve?(cve)
      # https://cve.mitre.org/cve/identifiers/syntaxchange.html
      cve.match(/^CVE-\d{4}-\d{1,7}$/i)
    end

    def valid_cpe?(cpe)
      config = CVEServer::Config.new
      return true if config.cpe_exceptions.include? cpe
      cpe.match(/^[a-z0-9_\%\~\.\-]+\:[a-z0-9_\%\~\.\-]+$/i)
    end

    def valid_cpes?(cpes)
      cpes.split(",").all? { |cpe| valid_cpe?(cpe) } ? true : nil
    end

    def valid_cpe_with_version?(cpe)
      cpe.match(/^[a-z0-9_\%\~\.\-\:]+$/i)
    end

    def valid_cpes_with_version?(cpes)
      cpes.split(",").all? { |cpe| valid_cpe_with_version?(cpe) } ? true : nil
    end

  end
end
