# -*- coding: binary -*-

module Msf
  module Java
    module Rmi
      module Client
        module Jmx
          # This mixin provides methods to simulate calls to the Java
          # javax/management/remote/rmi/RMIConnectionImpl_Stub
          # interface
          module Connection
            require 'msf/java/rmi/client/jmx/connection/builder'

            include Msf::Java::Rmi::Client::Jmx::Connection::Builder

            # Sends a call to the JMXRMI endpoint to retrieve an MBean instance. Simulates a call
            # to the Java javax/management/remote/rmi/RMIConnectionImpl_Stub#getObjectInstance()
            # method.
            #
            # @param opts [Hash]
            # @option opts [Rex::Socket::Tcp] :sock
            # @return [TrueClass, NilClass] true if success, nil otherwise
            # @raise [Rex::Proto::Rmi::Exception] if the endpoint raises a remote exception
            # @see Msf::Java::Rmi::Client::Registry::Builder.build_jmx_get_object_instance
            def send_jmx_get_object_instance(opts = {})
              send_call(
                sock: opts[:sock] || sock,
                call: build_jmx_get_object_instance(opts)
              )

              return_value = recv_return(
                sock: opts[:sock] || sock
              )

              if return_value.nil?
                return nil
              end

              if return_value.is_exception?
                raise ::Rex::Proto::Rmi::Exception, return_value.get_class_name
              end

              unless return_value.get_class_name == 'javax.management.ObjectInstance'
                return nil
              end

              true
            end

            # Sends a call to the JMXRMI endpoint to create an MBean instance. Simulates a call
            # to the Java javax/management/remote/rmi/RMIConnectionImpl_Stub#createMBean()
            # method.
            #
            # @param opts [Hash]
            # @option opts [Rex::Socket::Tcp] :sock
            # @return [TrueClass, NilClass] true if success, nil otherwise
            # @raise [Rex::Proto::Rmi::Exception] if the endpoint raises a remote exception
            # @see Msf::Java::Rmi::Client::Registry::Builder.build_jmx_create_mbean
            def send_jmx_create_mbean(opts = {})
              send_call(
                sock: opts[:sock] || sock,
                call: build_jmx_create_mbean(opts)
              )

              return_value = recv_return(
                sock: opts[:sock] || sock
              )

              if return_value.nil?
                return nil
              end

              if return_value.is_exception?
                raise ::Rex::Proto::Rmi::Exception, return_value.get_class_name
              end

              unless return_value.get_class_name == 'javax.management.ObjectInstance'
                return nil
              end

              true
            end

            # Sends a call to the JMXRMI endpoint to invoke an MBean method. Simulates a call
            # to the Java javax/management/remote/rmi/RMIConnectionImpl_Stub#invoke()
            # method.
            #
            # @param opts [Hash]
            # @option opts [Rex::Socket::Tcp] :sock
            # @return [TrueClass, NilClass] true if success, nil otherwise
            # @raise [Rex::Proto::Rmi::Exception] if the endpoint raises a remote exception
            # @see Msf::Java::Rmi::Client::Registry::Builder.build_jmx_invoke
            def send_jmx_invoke(opts = {})
              send_call(
                sock: opts[:sock] || sock,
                call: build_jmx_invoke(opts)
              )

              return_value = recv_return(
                sock: opts[:sock] || sock
              )

              if return_value.nil?
                return nil
              end

              if return_value.is_exception?
                raise ::Rex::Proto::Rmi::Exception, return_value.get_class_name
              end

              unless return_value.get_class_name == 'java.util.HashSet'
                return nil
              end

              true
            end
          end
        end
      end
    end
  end
end
