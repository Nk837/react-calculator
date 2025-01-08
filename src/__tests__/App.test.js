
// src/__tests__/App.test.js
import { render, screen } from '@testing-library/react';
import App from '../App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByPlaceholderText('0');
  expect(linkElement).toBeInTheDocument();
});
