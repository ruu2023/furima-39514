// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

window.addEventListener('turbo:load', function(){

  const itemPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('input', function(){
    const inputValue = itemPrice.value;
    taxPrice.innerHTML = Math.floor(inputValue * 0.1)
    profit.innerHTML = Math.floor(inputValue * 0.9 )
  })

})