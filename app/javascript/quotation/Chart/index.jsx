import React, { Component } from 'react'
import Yesterday from './yesterday'
import Month from './month'
import Week from './week'

class Chart extends Component {
  render() {
    const {currency} = this.props

    return (
      <div>
        <h1>Quotations from {currency.name}</h1>
        <Yesterday currency={currency}/>  
        <Month currency={currency} />  
        <Week currency={currency} />  
      </div>
    )
  }
}

export default Chart
