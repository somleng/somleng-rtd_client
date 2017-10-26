require 'spec_helper'
require 'somleng/rtd_client/client'

RSpec.describe Somleng::RTDClient::Client do
  describe "fetching real time data", :vcr do
    let(:real_time_data_helper) { RealTimeDataHelper.new }

    let(:asserted_results) {
      {
        "calls_count" => asserted_calls_count
      }
    }

    def assert_fetch_real_time_data!
      asserted_results.each do |asserted_key, asserted_value|
        expect(results[asserted_key]).to eq(asserted_value)
      end
    end

    describe "#fetch_aggregate_real_time_data!", :cassette => :fetch_real_time_data do
      let(:results) { subject.fetch_aggregate_real_time_data! }
      let(:asserted_calls_count) {
        real_time_data_helper.data_assertions[:aggregate][:calls_count]
      }

      it { assert_fetch_real_time_data! }
    end

    context "fetch_project_real_time_data!(project_id)", :cassette => :fetch_project_real_time_data do

      let(:project_id) { real_time_data_helper.project_assertions[:ews][:project_id] }
      let(:results) { subject.fetch_project_real_time_data!(project_id) }
      let(:asserted_calls_count) {
        real_time_data_helper.data_assertions[:projects][:ews][:calls_count]
      }
      it { assert_fetch_real_time_data! }
    end
  end
end
