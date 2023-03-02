import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["form", "input"]

    connect() {
        const form = this.formTarget;
        const inputs = this.inputTargets;
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
        }

        submitButton.addEventListener("mouseover", function() {
            form.setAttribute('action', form.action.replace('/preview', ''))
        })

        // setTimeout(function() {
        //     const autofocusElement = document.querySelector('[autofocus]')
        //     autofocusElement.focus()
        //     autofocusElement.selectionStart = autofocusElement.selectionEnd = 10000
        // }, 100)
    }
}