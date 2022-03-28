import { useState, useEffect } from 'react'
import logo from './logo.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch('/api/v1/users.json')
      .then((res) => res.json())
      .then((data) => setData(data));
  }, [])

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Hello Vite + React!</p>
        <p>
          <button type="button" onClick={() => setCount((count) => count + 1)}>
            count is: {count}
          </button>
        </p>
        <div>
          Users:
          <ul>
            {data.map(({id, first_name, last_name, email}: any) => <li>{id}. {first_name} {last_name}, {email}</li>)}
          </ul>
        </div>
      </header>
    </div>
  )
}

export default App
