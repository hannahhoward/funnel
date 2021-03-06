defmodule Funnel.Factory do

  use ExMachina

  def push_webhook_bad_body_factory do
    Poison.decode!(File.read!("test/support/bad_push.json"))
  end

  def push_webhook_good_body_factory do
    Poison.decode!(File.read!("test/support/good_push.json"))
  end

  def push_webhook_master_body_factory do
    Poison.decode!(File.read!("test/support/master_push.json"))
  end

  def pull_request_webhook_payload_factory do
    Poison.decode!(File.read!("test/support/pull_request_synchronize.json"))
  end

  def bad_push_scent_factory do
    %Funnel.Scent{
      action: "synchronize",
      owner_login: "outofambit",
      repo_name: "musical-spork",
      commit_sha: "029d4f9cc14efdfd69c326839809954844925370",
      default_branch_name: "master",
      installation_id: 66216,
      branch_name: "bad-boy",
    }
  end

  def good_push_scent_factory do
    %Funnel.Scent{
      action: "synchronize",
      commit_sha: "6b7d4200317e2b5e2cad2b19a22e7ad8e8add382",
      default_branch_name: "master",
      installation_id: 66216,
      owner_login: "outofambit",
      branch_name: "good-boy",
      repo_name: "musical-spork"
    }
  end

  def push_scent_factory do
    %Funnel.Scent{
      commit_sha: "966bf60dcd5b7eb57997ae88ef2e46f6549a9c8a",
      default_branch_name: "master",
      installation_id: 66216,
      owner_login: "outofambit",
      branch_name: "master",
      repo_name: "musical-spork"
    }
  end

  def success_status_factory do
    Funnel.Investigator.Status.success()
  end

  def pending_status_factory do
    Funnel.Investigator.Status.pending()
  end

  def failure_status_factory do
    Funnel.Investigator.Status.failure()
  end

end
