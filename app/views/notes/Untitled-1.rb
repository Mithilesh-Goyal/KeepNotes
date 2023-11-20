


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
