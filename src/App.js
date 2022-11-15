import logo from './cshift-circle.svg';
import cshiftC from './cshift-c.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <div>
          <img src={cshiftC} className="App-logo-c" alt="c" />
          <img src={logo} className="App-logo" alt="logo" />
        </div>
      </header>
    </div>
  );
}

export default App;
