import css from './app.module.css';

document.body.querySelector('#root').innerHTML = `
  <div class="${css.root}">
    I am styled using CSS modules!
  </div>
`;
