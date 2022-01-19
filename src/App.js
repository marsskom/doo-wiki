import {Alert, AlertTitle} from '@mui/material';
import './App.scss';

function App() {
    return (
        <div className="App">
            <header className="App-header">
                <Alert severity="success">
                    <AlertTitle>DooWiki</AlertTitle>
                    Hi! You are on <strong>index</strong> page!
                </Alert>
            </header>
        </div>
    );
}

export default App;
