document.addEventListener('turbo:load', priceCalFunction);
document.addEventListener('turbo:render', priceCalFunction);

function priceCalFunction() {
  console.log('turbo:load イベントが発生しました');
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  itemPrice.addEventListener('input', function() {
    const item = itemPrice.value;
    const tax = Math.floor(item * 0.1);
    taxPrice.innerHTML = tax;
    profit.innerHTML = item - tax;
  });
}