import React, { Component } from 'react'

class Header extends Component {
  constructor(props) {
    super(props)
    this.mountCurrencySelect = this.mountCurrencySelect.bind(this)
  }

  mountCurrencySelect() {
    const {currencies, selectedCurrency, handleCurrencyChange} = this.props

    return (
      <select onChange={(event) => handleCurrencyChange(event.target.value)}>
        {currencies.map((currency) => {
          return <option 
                  key={currency.id} 
                  defaultValue={selectedCurrency.id}
                  value={currency.id}>
                    {currency.name}
                  </option>
        })}
      </select>
    )
  }

  render() {
    return <h1>Should i buy {this.mountCurrencySelect()}</h1>
  }
}

export default Header
