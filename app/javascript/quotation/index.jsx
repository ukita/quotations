import React, { Component } from 'react'
import Header from './Header'
import Chart from './Chart'

function fetchCurrencies() {
  return fetch('/api/currencies').then(res => res.json())
}

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      currencies: [],
      selectedCurrency: null
    }
    this.handleCurrencyChange = this.handleCurrencyChange.bind(this)
  }

  componentDidMount() {
    fetchCurrencies()
      .then(json => this.setState({currencies: json, selectedCurrency: json[0]}))
  }

  handleCurrencyChange(currency_id) {
    let currency = this.state.currencies.filter(currency => currency.id == currency_id)[0]
    this.setState({selectedCurrency: currency})
  }

  render() {
    const {currencies, selectedCurrency} = this.state

    return(
      <div>
        <Header currencies={currencies} selectedCurrency={selectedCurrency} handleCurrencyChange={this.handleCurrencyChange}/>
        {selectedCurrency && <Chart currency={selectedCurrency}/>}
      </div>
    )
  }
}

export default App
