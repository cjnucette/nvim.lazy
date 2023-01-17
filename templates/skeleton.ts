console.log('Open index.html and get crazy!');
export function qs(selector: string, parent = document) {
  return parent.querySelector(selector);
}
export function qsa(selector: string, parent = document) {
  return [...parent.querySelectorAll(selector)];
}
