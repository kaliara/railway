import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["form"]
    static classes = ["hidden"]

    connect() {
        const form = this.formTarget;
        const formElements = form.querySelectorAll('input, select, textarea')
        const submitButton = form.querySelector('[type="submit"][name="commit"]')

        if (formElements) {
            formElements.forEach(formElement => {
                formElement.addEventListener("change", function() {
                    form.querySelector('[name="instant"]').click()
                })
            })
        }

        submitButton.addEventListener("click", function() {
            form.setAttribute('action', form.action.replace('/preview', ''))
        })
    }
}