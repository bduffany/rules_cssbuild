import css from './app.module.css';

test('class names should be suffixed', () => {
  expect(css.app).toEqual(expect.stringMatching(/app_.+/));
  expect(css.appChild).toEqual(expect.stringMatching(/app-child_.+/));
});
