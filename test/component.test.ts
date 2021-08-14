import classNames from './styles.module.css';

test('class names should match the expected pattern', () => {
  expect(classNames.fooLocal).toEqual(expect.stringMatching(/foo-local_.+/));
});
