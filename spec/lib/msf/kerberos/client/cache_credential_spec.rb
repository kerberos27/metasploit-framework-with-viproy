# -*- coding:binary -*-
require 'spec_helper'

require 'rex/proto/kerberos'
require 'msf/kerberos/client'

describe Msf::Kerberos::Client::CacheCredential do
  subject do
    mod = ::Msf::Exploit.new
    mod.extend ::Msf::Kerberos::Client
    mod.send(:initialize)
    mod
  end

  let(:cred_opts) do
    {
      :flags => 0x580000
    }
  end

  let(:time_opts) do
    {
      :auth_time => 123456
    }
  end

  let(:key_opts) do
    {
      :key_type => 25
    }
  end

  let(:principal_opts) do
    {
      :name_type => 3
    }
  end

  let(:cache_opts) do
    {
      :version => 21
    }
  end

  describe "#create_cache_credential" do
    context "when no opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::Credential" do
        expect(subject.create_cache_credential). to be_a(Rex::Proto::Kerberos::CredentialCache::Credential)
      end

      it "initializes the Credential with default values" do
        expect(subject.create_cache_credential.client.components).to eq([''])
      end
    end

    context "when opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::Credential" do
        expect(subject.create_cache_credential(cred_opts)).to be_a(Rex::Proto::Kerberos::CredentialCache::Credential)
      end

      it "initializes the Credential with opts when available" do
        expect(subject.create_cache_credential(cred_opts).tkt_flags).to eq(0x580000)
      end
    end
  end

  describe "#create_cache_times" do
    context "when no opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::Time" do
        expect(subject.create_cache_times).to be_a(Rex::Proto::Kerberos::CredentialCache::Time)
      end

      it "initializes the Time with default values" do
        expect(subject.create_cache_times.auth_time).to eq(0)
      end
    end

    context "when opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::Time" do
        expect(subject.create_cache_times(time_opts)).to be_a(Rex::Proto::Kerberos::CredentialCache::Time)
      end

      it "initializes the Time with opts when available" do
        expect(subject.create_cache_times(time_opts).auth_time).to eq(123456)
      end
    end
  end

  describe "#create_cache_key_block" do
    context "when no opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::KeyBlock" do
        expect(subject.create_cache_key_block).to be_a(Rex::Proto::Kerberos::CredentialCache::KeyBlock)
      end

      it "initializes the KeyBlock with default values" do
        expect(subject.create_cache_key_block.key_type).to eq(23)
      end
    end

    context "when opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::KeyBlock" do
        expect(subject.create_cache_key_block(key_opts)).to be_a(Rex::Proto::Kerberos::CredentialCache::KeyBlock)
      end

      it "initializes the KeyBlock with opts when available" do
        expect(subject.create_cache_key_block(key_opts).key_type).to eq(25)
      end
    end
  end

  describe "#create_cache_principal" do
    context "when no opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::Principal" do
        expect(subject.create_cache_principal).to be_a(Rex::Proto::Kerberos::CredentialCache::Principal)
      end

      it "initializes the Principal with default values" do
        expect(subject.create_cache_principal.name_type).to eq(0)
      end
    end

    context "when opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::Principal" do
        expect(subject.create_cache_principal(principal_opts)).to be_a(Rex::Proto::Kerberos::CredentialCache::Principal)
      end

      it "initializes the Principal with opts when available" do
        expect(subject.create_cache_principal(principal_opts).name_type).to eq(3)
      end
    end
  end

  describe "#create_cache" do
    context "when no opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::Cache" do
        expect(subject.create_cache).to be_a(Rex::Proto::Kerberos::CredentialCache::Cache)
      end

      it "initializes the Cache with default values" do
        expect(subject.create_cache.version).to eq(Rex::Proto::Kerberos::CredentialCache::VERSION)
      end
    end

    context "when opts" do
      it "creates a Rex::Proto::Kerberos::CredentialCache::Cache" do
        expect(subject.create_cache(cache_opts)).to be_a(Rex::Proto::Kerberos::CredentialCache::Cache)
      end

      it "initializes the Cache with opts when available" do
        expect(subject.create_cache(cache_opts).version).to eq(21)
      end
    end
  end

end

