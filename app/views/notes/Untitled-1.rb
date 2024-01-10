


debugger
$(<%= "card-#{@note.id}" %>).html("<%= j render 'edit_modal', note: @note %>");
$('#editModal').modal('show');



<%= form_for @note do |f| %>
                Color: <%= f.select :color , options_for_select(Note::COLOR_TYPE,selected:@note.color)  %>
                <%#= f.submit 'Update' %>
              <% end %>

<ul class="dropdown-menu"
  aria-labelledby="multiSelectDropdown">
  <%= form_for @note, url: {action: "add_label"} do |form| %>
    <li>
      <%= form.collection_check_boxes(:label_ids, Label.all, :id, :label_name, { multiple: true }) %>
      <%= form.submit "Add label" %>
      <% end %>
    </li>
</ul>

<ul class="dropdown"
aria-labelledby="multiSelectDropdown">
<%= form_for @note, url: {action: "add_label"} do |form| %>
  <li>
    <%= form.collection_check_boxes(:label_ids, Label.all, :id, :label_name, { multiple: true }) %>
    <%= form.submit "Add label" %>
    <% end %>
  </li>
</ul>






          <div class='container'>
  <div class='row'>
    <div class='col col-lg-2'>
      <%= content_for (:sidebar) do %>
        <%= render :partial => "layouts/sidebar" %>
      <% end %>
    </div>
    <div class='col col-lg-10'>
      <div class="row">
        <div class='col col-lg-3'>
        </div>
        <div class='col col-lg-7' id = "cracker1-button">
          <%= link_to new_note_path , remote: true do %>
            <table class="table table-bordered">
              <tr>
                <td>Take a note... </td>
              </tr>
            </table>
          <% end %>
        </div>
      </div>

      <div class='col col-lg-7' id="cracker1-button">
          <%= link_to new_note_path, remote: true, data: { toggle: 'modal', target: '#new' } do %>
            <table class="table table-bordered">
              <tr>
                <td>Take a note...</td>
              </tr>
            </table>
          <% end %>
      </div>

      <div class='row'>
        <div class='col col-lg-2'>
          <h4>Pinned</h4>
        </div>
      </div>
      <div class="row">
        <% (@notes.active & @notes.notdel & @notes.pinned).each_with_index do |note , index| %>
          <div class=" col-sm-3  note_div" data-note-id="<%= note.id %>" id="card-<%= note.id %>">
              <%= render partial: "note" , locals: { note: note} %>
          </div>
          <% if (index + 1) % 4 == 0 %>
            <div class="row"></div>
          <% end %>
        <% end %>
      </div>
      <div class='row'>
        <div class='col col-lg-2'>
          <h4>Others</h4>
        </div>
      </div>

      <div class="row">
        <% (@notes.active & @notes.notdel & @notes.unpinned).each_with_index do |note , index| %>
          <div class=" col-sm-3  note_div" data-note-id="<%= note.id %>" id="card-<%= note.id %>">
              <%= render partial: "note" , locals: { note: note} %>
          </div>
          <% if (index + 1) % 4 == 0 %>
            <div class="row"></div>
          <% end %>
        <% end %>
      </div>

    </div>
  </div>
</div>



<div class='container'>
  <div class='row'>
    <div class='col col-lg-2'>
      <%= content_for (:sidebar) do %>
        <%= render :partial => "layouts/sidebar" %>
      <% end %>
    </div>
    <div class='col col-lg-10'>
      <div class="row">
        <div class='col col-lg-3'>
        </div>
        <div class='col col-lg-7' id = "cracker1-button">
          <%= link_to new_note_path , remote: true do %>
            <table class="table table-bordered">
              <tr>
                <td>Take a note... </td>
              </tr>
            </table>
          <% end %>
        </div>
      </div>

      <div class='col col-lg-7' id="cracker1-button">
          <%= link_to new_note_path, remote: true, data: { toggle: 'modal', target: '#new' } do %>
            <table class="table table-bordered">
              <tr>
                <td>Take a note...</td>
              </tr>
            </table>
          <% end %>
      </div>

      <div class='row'>
        <div class='col col-lg-2'>
          <h4>Pinned</h4>
        </div>
      </div>
      <div class="row">
        <% (@notes.active & @notes.notdel & @notes.pinned).each_with_index do |note , index| %>
          <div class=" col-sm-3  note_div" data-note-id="<%= note.id %>" id="card-<%= note.id %>">
              <%= render partial: "note" , locals: { note: note} %>
          </div>
          <% if (index + 1) % 4 == 0 %>
            <div class="row"></div>
          <% end %>
        <% end %>
      </div>
      <div class='row'>
        <div class='col col-lg-2'>
          <h4>Others</h4>
        </div>
      </div>

      <div class="row">
        <% (@notes.active & @notes.notdel & @notes.unpinned).each_with_index do |note , index| %>
          <div class=" col-sm-3  note_div" data-note-id="<%= note.id %>" id="card-<%= note.id %>">
              <%= render partial: "note" , locals: { note: note} %>
          </div>
          <% if (index + 1) % 4 == 0 %>
            <div class="row"></div>
          <% end %>
        <% end %>
      </div>

    </div>
  </div>
</div>


$('#mynewnote').html("<%= j render 'new', note: @note %>");
$('#new').modal('show');

def create
  @note = Note.new(note_params)
  @note.unique_id= SecureRandom.hex(6)

  if @note.save
    flash[:success] = 'Note was successfully created.'
    # @notes = [note] + Note.order(created_at: :desc)
    redirect_to notes_path
  else
    render 'new'
  end
end




console.log("hii")
<% if @note.new_record? %>
alert('Failed');
<% else %>
$('h1').append("<%= j render(@note) %> ");
<% end %>













<div class='modal fade editModal' role="model-dialog" id= "card-<%= note.id %>' tabindex="-1">
  <div class='modal-dialog modal-lg'>
    <div class='modal-content'>
      <%= form_for(note,remote: true ) do |form| %>
        <div style="background-color: <%= @note.color.downcase %>;", class='T'>
          <div class='row'>
            <div class='col'>
              <%= form.text_area :title, placeholder: 'Title' %>
            </div>
            <% note.errors.full_messages_for(:title).each do |message| %>
              <div><%= message %></div>
            <% end %>
          </div>
          <div class='row mt-10 col-md-12'>
            <div class='col input'>
              <%= form.text_area :content, placeholder: 'Content' %>
            </div>
            <% note.errors.full_messages_for(:content).each do |message| %>
              <div><%= message %></div>
            <% end %>
          </div>
          <div class='row'>
            <div class='col'>
              <ul>
                <% note.labels.each do |label| %>
                  <%= label.label_name %>
                  <h7>/</h7>
                <% end %>
              </ul>
            </div>
          </div>

          <div class='row'>
            <div class='col'>
              <%= form.label :reminder, "Set Reminder Date" %>
              <%= form.datetime_field :reminder %>
            </div>
          </div>
          <%= form_for @note, url: {action: "add_label"} do |f| %>
          <% end %>

          <div class='row'>
            <div class='col col-sm-3'>
              Color: <%= form.select :color , options_for_select(Note::COLOR_TYPE,selected:@note.color)  %>
            </div>
            <div class='col col-sm-2'>
            </div>
            <div class='col col-sm-4'>
              <% if @note.image.attached? %>
                <%= image_tag (@note.image), height: 100 , width: 200 %>
                  <%= link_to "Delete Image", delete_image_note_path(@note), method: :delete, data: { confirm: "Are you sure you want to delete this image?" } %>
                <% else %>
                  <%= form.file_field :image %>
              <% end %>
            </div>
            <div class='col col-sm-2'>
              <li class='nav-item dropdown px-2'>
                <a class='nav-link dropdown-toggle' href="#" role="button"    data-bs-toggle="dropdown" aria-expanded="false">
                    <strong>more..</strong>
                </a>
                <ul class='dropdown-menu'>
                  <li>
                    <ul class="dropdown"
                      aria-labelledby="multiSelectDropdown">
                      <%= form_for @note, url: {action: "add_label"} do |f| %>
                        <li>
                          <%= f.collection_check_boxes(:label_ids, Label.all, :id, :label_name, { multiple: true }) %>
                          <%= f.submit "Add label" %>
                        </li>
                      <% end %>
                    </ul>
                  </li>
                  <% if note.stage == 'notdel'%>
                    <li>
                      <%= link_to 'Create Copy', copy_note_path(note), method: :post%>
                    </li>
                    <li>
                      <%= link_to 'Delete Note', [:soft_delete, note], method: :patch , remote: true %>
                    </li>
                    <% if note.status == "active" %>
                      <li>
                        <%= link_to 'Archived', [:archive, note], method: :put %>
                      </li>
                    <% else %>
                      <li>
                        <%= link_to 'UnArchived', [:notarchive, note], method: :put %>
                      <li>
                    <% end %>
                    <% if note.pin %>
                      <li>
                        <%= link_to 'UnPin', [:unpinned, note], method: :put %>
                      </li>
                    <% else %>
                      <li>
                        <%= link_to 'Pin', [:pinned, note], method: :put %>
                      </li>
                    <% end %>
                  <% else %>
                    <li>
                      <%= link_to 'Restore', [:restore, note], method: :put %>
                    </li>
                    <li>
                      <%= link_to 'Destroy', note_path(note),
                                  method: :delete,
                                  data: { confirm: 'Are you sure?' } %>
                    </li>
                  <% end %>
                </ul>
              </li>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-9">
              <%= form.submit 'save' %>
            </div>
            <div class='col-sm-3'>
              <% if note.created_at.strftime('%d-%b-%y') != note.updated_at.strftime('%d-%b-%y') %>
                Edited <%= note.formatted_date %>
              <% end %>
              <br>
              <% if note.created_at.strftime('%H:%M') != note.updated_at. strftime('%H:%M') %>
                Edited <%= note.formatted_time %>
              <% end %>
            </div>
          </div>
        </div>
      <% end %>
    </div>
  </div>
</div>



<h2>Sign up</h2>

<%= simple_form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>
  <%= f.error_notification %>

  <div class="form-inputs">
    <%= f.input :email,
                required: true,
                autofocus: true,
                input_html: { autocomplete: "email" }%>
    <%= f.input :password,
                required: true,
                hint: ("#{@minimum_password_length} characters minimum" if @minimum_password_length),
                input_html: { autocomplete: "new-password" } %>
    <%= f.input :password_confirmation,
                required: true,
                input_html: { autocomplete: "new-password" } %>
  </div>

  <div class="form-actions">
    <%= f.button :submit, "Sign up" %>
  </div>
<% end %>

<%= render "devise/shared/links" %>





<h2>Log in</h2>

<%= simple_form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
  <div class="form-inputs">
    <%= f.input :email,
                required: false,
                autofocus: true,
                input_html: { autocomplete: "email", class: "equal-size-input" } %>
    <%= f.input :password,
                required: false,
                autofocus: true,
                input_html: { autocomplete: "current-password", class: "equal-size-input" } %>
    <%= f.input :remember_me, as: :boolean, input_html: {  } if devise_mapping.rememberable? %>
  </div>

  <div class="form-actions">
    <%= f.button :submit, "Log in" %>
  </div>
<% end %>

<%= render "devise/shared/links" %>











Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.action_mailer.raise_delivery_errors = true

config.action_mailer.raise_delivery_errors = true
config.action_mailer.perform_deliveries = true
config.action_mailer.default.url.options = { host: 'localhost:3000' }
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',  # Required for gmail.com
  user_name:            'mithilesh.goyal1@gmail.com',
  password:             'dlce wfrs fkhv rhtl',
  # password:             'wpfa vdqs wrqv kkcp',
  authentication:       'plain',
  :enable_starttls_auto => true
  ssl: true
}


end







edit.js.erb

$('.editModal').modal('hide');
$('#mynote').html("<%= j render 'edit_modal', note: @note %>");
$('.editModal').modal()
$('.editModal').modal('toggle')
