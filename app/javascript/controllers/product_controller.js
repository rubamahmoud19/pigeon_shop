import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {}

  handleClick() {
    var elem = this.element;
    elem.disabled = true;
    if (document.getElementsByClassName("basket-contents").length > 0) {
      addProduct(elem);
    } else {
      fetch(`/baskets/new`, {
        method: "GET",
        mode: "cors",
        cache: "no-cache",
        contentType: "application/json",
        headers: {
          "Content-Type": "application/json",
        },
      })
        .then((response) => response.json())
        .then((data) => {
          document.getElementById("basket").innerHTML += data.form;
          addProduct(elem);
        });
    }
  }

  removeProduct() {
    var elem = this.element;
    var parentSelector = document.getElementById("product_" + elem.value);
    console.log("product_" + elem.value);
    var addToBasketBtn = parentSelector.querySelector(".add-to-basket-btn");
    addToBasketBtn.innerHTML = "+ Add to basket";
    addToBasketBtn.disabled = false;
    elem.parentElement.remove();
    var selectedProducts =
      document.getElementsByClassName("selected-products")[0];
    total(
      Array.from(selectedProducts.querySelectorAll("input")).map(
        (element) => element.value
      )
    );
  }
}

var total = (productsIds) => {
  var sum = 0;
  productsIds.forEach(
    (e) =>
      (sum += parseFloat(
        document.getElementById("product_" + e).getAttribute("product-price")
      ))
  );
  document.querySelector(".basket-total").textContent = sum;
};

function addProduct(elem) {
  elem.textContent = "Added to basket!";
  var id = elem.getAttribute("product");
  var selectedProducts =
    document.getElementsByClassName("selected-products")[0];
  selectedProducts.innerHTML +=
    '<div class = "my-5"><input type="checkbox" checked value="' +
    id +
    '" name="basket[product_ids][]" id="basket_product_ids_' +
    id +
    '" data-controller="product" data-action="click->product#removeProduct">' +
    '<label for="basket_product_ids_' +
    id +
    '">' +
    document.querySelector(".product-name-" + id).textContent +
    "</label></div>";
  total(
    Array.from(selectedProducts.querySelectorAll("input")).map(
      (element) => element.value
    )
  );
}
