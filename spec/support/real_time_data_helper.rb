class RealTimeDataHelper
  def project_env
    Hash[project_assertions.map { |project_key, data| [data[:env_var_key], data[:project_id]] }]
  end

  def project_assertions
    @project_assertions ||= {
      :ews => {
        :project_id => "6bb193d9-876e-4846-a42f-8a35db66b477",
        :env_var_key => "EWS_PROJECT_ID"
      },
      :avf => {
        :project_id => "11d41773-cb37-4614-883d-602bb4e1824e",
        :env_var_key =>  "AVF_PROJECT_ID"
      }
    }
  end

  def data_assertions
    @data_assertions ||= {
      :aggregate => {
        :calls_count => 237582
      },
      :projects => {
        :ews => {
          :calls_count => 192835
        }
      }
    }
  end
end
