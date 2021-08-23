import css from './app.module.css';

document.body.querySelector('#root').innerHTML = `
  <div class="${css.root}">
    <span>My parent element is styled with locally-scoped CSS!</span>
  </div>
`;
