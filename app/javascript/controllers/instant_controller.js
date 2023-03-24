import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "stepper", "link"]

  connect() {
    const form = this.formTarget;
    const inputs = this.inputTargets;
    const links = this.linkTargets;
    const formElements = form.querySelectorAll('input:not([type="submit"]), select, textarea')
    const submitButton = form.querySelector('[type="submit"][name="commit"]')

    const addFocusParam = function(name) {
      let focusParamInput = document.createElement("input");
      focusParamInput.setAttribute("type", "hidden");
      focusParamInput.setAttribute("name", "focus");
      focusParamInput.setAttribute("value", name);
      form.appendChild(focusParamInput);
    }

    if (formElements) {
      inputs.forEach(input => {
        ['mouseover', 'focus'].forEach(function(e) {
          input.addEventListener(e, function() {
            if (!form.action.includes('/preview')) {
              form.setAttribute('action', form.action.concat('/preview'))
            }
          })
        });

        input.addEventListener("change", function() {
          for (let i = 0; i < inputs.length; i++) {
            if (inputs[i] == input) {
              if ((input.value.length > 0) && inputs[i + 1] && inputs[i + 1].name) {
                addFocusParam(inputs[i + 1].name)
              }
            }
          }
          form.querySelector('[name="instant"]').click()
        })
      })
      links.forEach(link => {
        ['mouseover', 'focus'].forEach(function(e) {
          link.addEventListener(e, function() {
            if (!form.action.includes('/preview')) {
              form.setAttribute('action', form.action.concat('/preview'))
            }
          })
        });

        link.addEventListener("click", function(e) {
          var xmlHttp = new XMLHttpRequest();
          xmlHttp.open("GET", link.href, false);
          xmlHttp.send(null);
          e.preventDefault();
          form.querySelector('[name="instant"]').click()
        })
      })
    }

    submitButton.addEventListener("mouseover", function() {
      form.setAttribute('action', form.action.replace('/preview', ''))
    })
  }

  updatePartySize() {
    const steppers = this.stepperTargets
    const guestContainer = document.querySelector('[data-guests]')
    let partySize = 1;

    if (guestContainer) {
      steppers.forEach(stepper => {
        const guests = stepper.value || 0
        partySize += parseInt(guests);
      })
      document.querySelectorAll('[data-party]').forEach(element => {
        if (element) {
          if (element.value) {
            element.value = partySize
          } else {
            element.innerHTML = partySize - 1
          }
        }
      })
      if (partySize > 1) {
        guestContainer.style.display = 'block'
      } else {
        guestContainer.style.display = 'none'
      }
    }
  }
}
