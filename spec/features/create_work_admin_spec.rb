RSpec.describe 'Creating a new Work as admin', :js, :workflow do
  let(:user) { create(:admin) }
  let(:admin_set_1) do
    create(:admin_set, id: AdminSet::DEFAULT_ID,
                       title: ["Default Admin Set"],
                       description: ["A description"],
                       edit_users: [user.user_key])
  end
  let(:admin_set_2) do
    create(:admin_set, title: ["Another Admin Set"],
                       description: ["A description"],
                       edit_users: [user.user_key])
  end

  context 'when there are multiple admin sets' do
    before do
      create(:permission_template_access,
             :deposit,
             permission_template: create(:permission_template, source_id: admin_set_1.id, with_admin_set: true, with_active_workflow: true),
             agent_type: 'user',
             agent_id: user.user_key)
      create(:permission_template_access,
             :deposit,
             permission_template: create(:permission_template, source_id: admin_set_2.id, with_admin_set: true, with_active_workflow: true),
             agent_type: 'user',
             agent_id: user.user_key)
      sign_in user
    end

    it "allows default admin set to be the first item in the select menu" do
      pending("Admin sets no longer appear on the admin dashboard in the analytics rewrite. Not sure where admin set page will move to")
      raise "Admin set to move off the dashboard for admins"
      # visit '/dashboard'
      # click_link 'Works'
      # click_link "Add new work"
      # choose "payload_concern", option: "GenericWork"
      # click_button 'Create work'
      # click_link "Relationship" # switch tab
      # expect(page).to have_content('Administrative Set')
      # expect(page).to have_content('Second Admin Set')
      # expect(page).to have_content('Default Admin Set')
      # expect(page).to have_selector('select#generic_work_admin_set_id')
      # expect(page).to have_select('generic_work_admin_set_id', selected: 'Default Admin Set')
    end
  end
end
