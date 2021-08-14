module.exports = {
  testEnvironment: 'node',
  haste: {
    enableSymlinks: true,
  },
  reporters: ['default'],
  testMatch: ['**/*.test.js'],
  moduleNameMapper: {
    'rules_cssbuild/(.*)': '<rootDir>/$1',
  },
};
