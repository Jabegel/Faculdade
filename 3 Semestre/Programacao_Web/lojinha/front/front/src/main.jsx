import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import ListaProdutos from './ListaProdutos.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <ListaProdutos />
  </StrictMode>,
)
