import classNames from './app.module.css';

test('class names should be suffixed', () => {
  expect(classNames.app).toEqual(expect.stringMatching(/app_.+/));
  expect(classNames.appChild).toEqual(expect.stringMatching(/app-child_.+/));
});
