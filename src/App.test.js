import {render, screen} from '@testing-library/react';
import App from './App';

test('renders DooWiki text', () => {
    render(<App/>);
    const linkElement = screen.getByText(/DooWiki/i);
    expect(linkElement).toBeInTheDocument();
});
