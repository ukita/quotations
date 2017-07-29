import React, { Component } from 'react'
import Yesterday from './yesterday'

class Chart extends Component {
  render() {
    const {currency} = this.props

    return (
      <div>
        <h1>Here should have the quotations from {currency.name}</h1>
        <Yesterday currency={currency}/>
      </div>
    )
  }
}

export default Chart
