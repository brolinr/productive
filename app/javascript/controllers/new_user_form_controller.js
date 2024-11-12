import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="new-user-form"
export default class extends Controller {
  connect() {}

  remove(event) {
    console.log(event.target);
    event.target.parentElement.parentElement.remove();
  }

  add_user(event) {
    console.log("Konale");
    const email = document.querySelector(
      '#add-user-form input[placeholder="test@test.com"]'
    );
    const role = document.querySelector("#add-user-form select");
    let node = document.createElement("div");
    node.className = "project_user w-full flex flex-row gap-4 my-2";
    node.innerHTML = this.user(email.value, role.value);
    document.getElementById("added-users").appendChild(node);
    email.value = "";
  }

  user(email, role) {
    return `
      <div class="w-4/5 flex gap-2 flex-row">
        <div class="w-1/2">
          <label for="country" class="block text-sm/6 font-medium text-gray-900">Email address</label>
          <div class="mt-2">
            <input value="${email}" disabled class="border-1 bg-white text-gray-900 placeholder:text-gray-400 border-slate-400 rounded w-full">
          </div>
        </div>

        <div class="w-1/2">
          <label for="country" class="block text-sm/6 font-medium text-gray-900">Role</label>
          <div class="mt-2">
            <select value="${role}" class="border-1 bg-white text-gray-900 placeholder:text-gray-400 border-slate-400 rounded w-full">
              <option>Manager</option>
              <option>Member</option>
            </select>
          </div>
        </div>
      </div>
      <div class="w-1/5 flex items-center justify-center pt-6" data-action="click->new-user-form#remove">
        <span class="w-8 h-8 rounded-full bg-rose-400 flex items-center justify-center text-white font-bold">-</span>
      </div>
    `;
  }
}
