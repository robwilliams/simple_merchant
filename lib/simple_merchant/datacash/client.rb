module SimpleMerchant
  module Datacash
    class Client
      def initialize(options={})
        @client      = options.fetch(:client)
        @password    = options.fetch(:password)
        @endpoint    = options.fetch(:endpoint)
        @rest_client = options.fetch(:rest_client, RestClient)
      end

      def request(&block)
        Response.new(
          send_to_datacash(xml_wrapper {|xml| yield(xml)})
        )
      end

      def query(datacash_reference)
        Response.new(
          send_to_datacash(query_xml(datacash_reference))
        )
      end

      private
      attr_reader :client, :password, :endpoint, :rest_client

      def send_to_datacash(xml_string)
        rest_client.post(endpoint, :body => xml_string)
      end

      def query_xml(datacash_reference)
        xml_wrapper do |xml|
          xml.tag! :HistoricTxn do
            xml.tag! :method, 'query'
            xml.tag! :reference, datacash_reference
          end
        end
      end

      def xml_wrapper
        xml = Builder::XmlMarkup.new :indent => 2
        xml.instruct!
        xml.tag! :Request do
          xml.tag! :Authentication do
            xml.tag! :client,   client
            xml.tag! :password, PASSWORD
          end
          xml.tag! :Transaction do
            yield(xml)
          end
        end
        xml.target!
      end
    end
  end
end
